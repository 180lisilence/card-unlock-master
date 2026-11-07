package harness;

import com.crackmaster.app.CardFactory;
import com.crackmaster.app.CardFactory.Format;
import com.crackmaster.app.CardFactory.Length;
import com.license.verify2.LicenseVerify;
import com.license.verify2.VerifyResult;

import java.util.List;

/**
 * 交叉验证 1（发卡正确性）：
 * 用「原始 verify2 反编译源码」的 LicenseVerify.verify() 检验
 * 「解卡大师 CardFactory」生成的终身卡是否真实有效。
 */
public class KeygenHarness {

    private static int pass = 0, fail = 0;

    private static void check(boolean cond, String name) {
        if (cond) { pass++; System.out.println("[PASS] " + name); }
        else { fail++; System.out.println("[FAIL] " + name); }
    }

    public static void main(String[] args) throws Exception {
        String key = "TESTKEY123456";
        String dev = "A1B2C3D4E5F6G7H8";

        // 原始模块初始化
        LicenseVerify.init(key);

        // 1. 终身卡（各种格式/长度）必须通过原始验证
        Format[] formats = {Format.ALPHA, Format.DIGIT};
        Length[] lengths = {Length.L32, Length.L16, Length.L10};
        for (Format f : formats) {
            for (Length l : lengths) {
                String card = CardFactory.generate(key, dev, CardFactory.TYPE_LIFETIME, f, l);
                VerifyResult r = LicenseVerify.verify(card, dev);
                check(r.success && r.lifetime,
                        f + "/" + l + " 终身卡通过原始验证 (card=" + card + ", msg=" + r.message + ")");
            }
        }

        // 2. 批量生成的每张都必须有效
        List<String> batch = CardFactory.generateBatch(key, dev, CardFactory.TYPE_LIFETIME, Format.ALPHA, Length.L32, 10);
        boolean allOk = batch.size() == 10;
        for (String c : batch) {
            VerifyResult r = LicenseVerify.verify(c, dev);
            if (!r.success || !r.lifetime) allOk = false;
        }
        check(allOk, "批量 10 张终身卡全部通过原始验证");

        // 3. 非终身类型也应有效（证明整条链路对齐，非终身卡特例）
        String yearCard = CardFactory.generate(key, dev, 7, Format.ALPHA, Length.L32);
        VerifyResult yr = LicenseVerify.verify(yearCard, dev);
        check(yr.success && !yr.lifetime && "年卡".equals(yr.cardTypeName),
                "年卡通过原始验证且类型识别正确 (" + yr.cardTypeName + "/" + yr.durationText + ")");

        // 4. 反向用例：错误设备码必须失败
        String wrongDev = "Z9Y8X7W6V5U4T3S2";
        VerifyResult rw = LicenseVerify.verify(batch.get(0), wrongDev);
        check(!rw.success, "错误设备码验证失败（符合预期: " + rw.message + "）");

        // 5. 反向用例：篡改一位必须失败
        char[] cc = batch.get(0).toCharArray();
        cc[3] = cc[3] == 'A' ? 'B' : 'A';
        VerifyResult rt = LicenseVerify.verify(new String(cc), dev);
        check(!rt.success, "篡改卡密验证失败（符合预期: " + rt.message + "）");

        // 6. 反向用例：错误密钥生成的卡必须失败
        String badKeyCard = CardFactory.generate("WRONGKEY", dev, CardFactory.TYPE_LIFETIME, Format.ALPHA, Length.L32);
        VerifyResult rb = LicenseVerify.verify(badKeyCard, dev);
        check(!rb.success, "错误密钥卡验证失败（符合预期: " + rb.message + "）");

        // 7. 设备指纹函数与原始实现一致
        String fpMine = CardFactory.deviceFingerprint(dev, 4, false);
        String fpOrig = com.license.verify2.CryptoUtil.deviceFingerprint(dev, 4, false);
        check(fpMine.equals(fpOrig), "deviceFingerprint 与原始一致 (" + fpMine + ")");

        System.out.println("=======================================");
        System.out.println("结果: " + pass + " 通过, " + fail + " 失败");
        if (fail > 0) System.exit(1);
    }
}
