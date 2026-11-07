import com.crackmaster.app.DexPatcher;
import java.io.File;
import java.io.FileOutputStream;

/** 用真实 DexPatcher 修补 payload.dex，供 dexdump 校验。 */
public class VerifyPatch {
    public static void main(String[] a) throws Exception {
        byte[] d = DexPatcher.readFile(new File(a[0]));
        DexPatcher.Result r = DexPatcher.patch(d, new DexPatcher.Log() {
            public void log(String s) { System.out.println(s); }
        });
        FileOutputStream o = new FileOutputStream(a[1]);
        o.write(d); o.close();
        System.out.println("summary: " + r.summary());
    }
}