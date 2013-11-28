package org.bmema.usedcars.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;
import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Mode;


public class ImageService {
	
	public static final String PERSISTENCE_PATH = "C:\\dev\\usedcars\\images\\";
	public static final String CONTEXT_PATH = "/images/";
	public static final int THUMBNAIL_SIZE = 100;
	private static Logger logger = Logger.getLogger("ImageService");
	
	public boolean createThumbnailFile(File originalImage) {
		InputStream is = null;
		try {			
			is = new FileInputStream(originalImage);
			BufferedImage img = ImageIO.read(is);
			BufferedImage scaledImg = Scalr.resize(img, Mode.AUTOMATIC, THUMBNAIL_SIZE, THUMBNAIL_SIZE);
			ImageIO.write(scaledImg, "jpg", new File(getThumbnailPath(originalImage)));
			return true;
		} catch (Exception e) {
			logger.error("Unable to create thumbnail of image:\n" + originalImage.getPath(), e);
			return false;
		} finally {
			try {
				is.close();
			} catch (IOException e) {
				logger.error("Unable to close input stream for image:\n" + originalImage.getPath(), e);
			}
		}
	}
	
	public static String getThumbnailPath(File image) {
		StringBuilder sb = new StringBuilder(image.getPath());
		sb.insert(image.getPath().lastIndexOf('.'), "_tmb");
		return sb.toString();
	}
	
	public static String getThumnailURLPath(File image) {
		StringBuilder sb = new StringBuilder(image.getPath());
		sb.insert(image.getPath().lastIndexOf('.'), "_tmb");
		return sb.toString().replace(File.separator, "/");
		//Megj: A File.separator nem mûködik, mert csak futási
	}
	
	private String getExtension(String path) {
		return path.substring(path.lastIndexOf('.') + 1);
	}
}
