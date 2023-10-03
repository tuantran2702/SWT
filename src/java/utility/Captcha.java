/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utility;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 *
 * @author Mido
 */
public class Captcha {
    public static boolean checkToken(String token) throws MalformedURLException, IOException {
        URL url = new URL("https://www.google.com/recaptcha/api/siteverify");
        
        HttpURLConnection conn = (HttpURLConnection)url.openConnection();
        conn.setRequestMethod("POST");
        
        conn.setDoInput(true);
        conn.setDoOutput(true);
        
        
        try (OutputStream os = conn.getOutputStream()) {
            os.write(("secret=6LdilFUgAAAAAM7Ar_xeSjEuhRhHBg5Dq67I1nBG&response=" + token).getBytes());
            os.flush();
        }
        
        try (BufferedReader bf = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
            String line = null;
            int i = 0;
            while ((line = bf.readLine()) != null) {
                System.out.println(line);
                if(i==1)
                    return line.contains("true");
                i++;
            }
        }
        
        conn.disconnect();
        return false;
    }
}
