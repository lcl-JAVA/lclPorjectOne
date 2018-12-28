package com.example.demo.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Random;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.Binarizer;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.EncodeHintType;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.Result;
public class Qrcode {
	//生成二维码
	public static String createQrcode(String _text){
	        String qrcodeFilePath = "";
	        try {
	            int qrcodeWidth = 300;
	            int qrcodeHeight = 300;
	            String qrcodeFormat = "png";
	            HashMap<EncodeHintType, String> hints = new HashMap<EncodeHintType, String>();
	            hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
	            BitMatrix bitMatrix = new MultiFormatWriter().encode(_text, BarcodeFormat.QR_CODE, qrcodeWidth, qrcodeHeight);
	            BufferedImage image = new BufferedImage(qrcodeWidth, qrcodeHeight, BufferedImage.TYPE_INT_RGB);
	            Random random = new Random();
	            File QrcodeFile = new File("D:\\qrcode\\" + random.nextInt() + "." + qrcodeFormat);
	            ImageIO.write(image, qrcodeFormat, QrcodeFile);
	            MatrixToImageWriter.writeToFile(bitMatrix, qrcodeFormat, QrcodeFile);
	            qrcodeFilePath = QrcodeFile.getAbsolutePath();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return qrcodeFilePath;
	    }
	
	//解析二维码
	 public static String decodeQr(String filePath) {
	        String retStr = "";
	        if ("".equalsIgnoreCase(filePath) && filePath.length() == 0) {
	            return "图片路径为空!";
	        }
	        try {
	            BufferedImage bufferedImage = ImageIO.read(new FileInputStream(filePath));
	            LuminanceSource source = new BufferedImageLuminanceSource(bufferedImage);
	            Binarizer binarizer = new HybridBinarizer(source);
	            BinaryBitmap bitmap = new BinaryBitmap(binarizer);
	            HashMap<DecodeHintType, Object> hintTypeObjectHashMap = new HashMap<>();
	            hintTypeObjectHashMap.put(DecodeHintType.CHARACTER_SET, "UTF-8");
	            Result result = new MultiFormatReader().decode(bitmap, hintTypeObjectHashMap);
	            retStr = result.getText();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return retStr;
	 }

}