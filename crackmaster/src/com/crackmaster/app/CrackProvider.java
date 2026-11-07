package com.crackmaster.app;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;

import java.io.File;
import java.io.FileNotFoundException;

/**
 * 极简文件提供器：把 getExternalFilesDir 下的破解产物通过 content:// 分享给安装器。
 * 不依赖 androidx，仅开放本应用输出目录内的既有文件（只读）。
 */
public class CrackProvider extends ContentProvider {

    public static final String AUTHORITY = "com.crackmaster.app.fileprovider";

    @Override
    public boolean onCreate() {
        return true;
    }

    @Override
    public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        if (!"r".equals(mode)) throw new SecurityException("只读");
        String name = uri.getLastPathSegment();
        if (name == null || name.contains("..") || name.contains("/")) {
            throw new SecurityException("非法路径: " + uri);
        }
        File dir = getContext().getExternalFilesDir(null);
        File f = new File(dir, name);
        try {
            String base = dir.getCanonicalPath();
            String target = f.getCanonicalPath();
            if (!target.startsWith(base + File.separator)) throw new SecurityException("越界路径: " + uri);
        } catch (Exception e) {
            throw new SecurityException("路径校验失败: " + e);
        }
        if (!f.exists() || !f.isFile()) throw new FileNotFoundException(f.getAbsolutePath());
        return ParcelFileDescriptor.open(f, ParcelFileDescriptor.MODE_READ_ONLY);
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
        return null;
    }

    @Override
    public String getType(Uri uri) {
        return "application/vnd.android.package-archive";
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        throw new UnsupportedOperationException("只读");
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException("只读");
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException("只读");
    }
}
