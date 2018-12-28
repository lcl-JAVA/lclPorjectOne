package com.example.demo.util;

import java.io.File;
import java.io.IOException;
public class File1 {
	/**
	 * 创建文件夹
	 */
	public void createFile(){
		File file1 = new File("F:/AAA/BBB/CCC");
        if (file1.mkdirs()) {
            System.out.println("多级层文件夹创建成功！创建后的文件目录为：" + file1.getPath() + ",上级文件为:" + file1.getParent());
        }

        File file2 = new File("F:/AAA/BBB/CCC/DDD");
        if (file2.mkdir()) {
            System.out.println("单文件夹 DDD 创建成功！创建后的文件目录为：" + file2.getPath() + ",上级文件为:" + file2.getParent());
        }

        File file3 = new File("F:/AAA/BBB/CCC/DDD","mytest.txt");
        try {
            if (file3.createNewFile()) {
                System.out.println("多级层文件夹下文件创建成功！创建了的文件为:" + file3.getAbsolutePath() + ",上级文件为:" + file3.getParent());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
	
	
	
	/**
     * 删除某个文件夹下的所有文件夹和文件
     *
     * @param delpath
     * @throws FileNotFoundException IOException
     * @return boolean
     */
    public static boolean deletefile(String delpath) throws Exception {
        File file = new File(delpath);
        if (file.isDirectory()) {
            String[] filelist = file.list();
            for (String delFile : filelist) {
                File delfile = new File(delpath + File.separator + delFile);
                if (delfile.isDirectory()) {
                    deletefile(delpath + File.separator + delFile);
                } else
                    System.out.println("正在删除文件：" + delfile.getPath() + ",删除是否成功：" + delfile.delete());
            }
            System.out.println("正在删除空文件夹：" + file.getPath() + ",删除是否成功：" + file.delete());
        } else {
        	System.out.println("正在删除文件：" + file.getPath() + ",删除是否成功：" + file.delete());
        }
        return true;
    }
    
    
    
}
