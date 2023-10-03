/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utility;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author Mido
 */
public class StringHelper {

    public static double[] getDoubleArr(String s, String regex) {
        String[] priceArr = s.split(regex);
        double[] ans = new double[priceArr.length + 1];
        for (int i = 0; i < priceArr.length; i++) {
            if (priceArr[i] == null || priceArr[i].equals("null")) {
                ans[i] = -1;
            } else {
                ans[i] = Double.parseDouble(priceArr[i]);
            }
        }
        return ans;
    }

    public static int[] getIntArr(String s, String regex) {
        String[] priceArr = s.split(regex);
        int[] ans = new int[priceArr.length + 1];
        for (int i = 0; i < priceArr.length; i++) {
            if (priceArr[i] == null || priceArr[i].equals("null")) {
                ans[i] = -1;
            } else {
                ans[i] = Integer.parseInt(priceArr[i]);
            }
        }
        return ans;
    }

    public static String getPriceString(double price) {
        String s = (int) price - (int) price % 1000 + "";
        int n = s.length();
        String priceString = "";
        for (int i = 0; i < n; i++) {
            priceString += s.charAt(i);
            if ((n - i - 1) % 3 == 0 && i != n - 1) {
                priceString += ".";
            }
        }
        return priceString;
    }

    public static String toSHA256(String str) {
        MessageDigest digest;
        try {
            digest = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
        byte[] hash = digest.digest(str.getBytes(StandardCharsets.UTF_8));
        String hexString = DatatypeConverter.printHexBinary(hash);
        return hexString;
    }

}
