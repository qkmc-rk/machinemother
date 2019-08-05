package xyz.ruankun.machinemother.util;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MD5Test {

    @Test
    public void m1(){
        System.out.println("密码是： + " + MD5Util.md5("admin"));//盐 ：machinemother
    }

    @Test
    public void m2(){
        System.out.println(MD5Util.md5("Jason"));
    }

//    @Test
//    public void m3(){
////        Resource resource = new ClassPathResource("script/tst.sh");
////        try {
//////            File file = resource.getFile();
//////            FileInputStream inputStream = new FileInputStream(file);
//////            BufferedReader bufferedReader
//////                    = new BufferedReader(new InputStreamReader(inputStream));
//////            String line = null;
//////            List<String> cmds = new ArrayList<>();
//////            StringBuilder stringBuilder = new StringBuilder();
//////            while ((line = bufferedReader.readLine()) != null){
//////                cmds.add(line);
//////            }
//////            Object[] o = cmds.toArray();
//////            String[] cmds2 = new String[o.length];
//////            for (int i = 0 ; i < o.length; i++){
//////                cmds2[i] = (String) o[i];
//////            }
//////            System.out.println(stringBuilder.toString());
////
////
////            Process process = Runtime.getRuntime().exec(resource.getURI().getPath());
////
////            process.waitFor();
////
////            BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
////            StringBuffer sb = new StringBuffer();
////            String line2;
////            List<String> strs = new ArrayList<>();
////            while ((line2 = br.readLine()) != null) {
////                strs.add(line2);
////                sb.append(line2);
////            }
////            sb.append(strs.get(strs.size() - 1));
////            System.out.println(sb.toString());
////        } catch (IOException e) {
////            e.printStackTrace();
////        } catch (InterruptedException e) {
////            e.printStackTrace();
////        }
////    }

}
