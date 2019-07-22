package xyz.ruankun.machinemother.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class CloseUtil {

    /**
     * 关闭文件输入流和输出流
     * @param inputStream
     * @param outputStream
     */
    public static void closeInAndOutPutStream(InputStream inputStream, OutputStream outputStream){
        if(inputStream != null){
            try {
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if(outputStream != null){
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
