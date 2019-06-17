package xyz.ruankun.machinemother.util;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestMapToXML {

    @Test
    public void main() throws Exception {
        Map<String,String> map = new HashMap<>();
        map.put("return_code","SUCCESS");
        map.put("return_msg","OK");
        try {
            String rs = WePayUtil.mapToXml(map);
            System.out.println(rs);
        } catch (Exception e) {
            System.err.println("有错");
        }
        String xml = "<xml>\n" +
                "  <return_code><![CDATA[SUCCESS]]></return_code>\n" +
                "  <return_msg><![CDATA[OK]]></return_msg>\n" +
                "</xml>";
        System.out.println(WePayUtil.xmlToMap(xml).toString());
    }
}
