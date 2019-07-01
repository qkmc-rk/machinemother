package xyz.ruankun.machinemother.util;

import org.apache.commons.codec.digest.DigestUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * Created by mrruan on 2019/06/15.
 */
public class WePayUtil {




    /**
         * 获取随机字符串 (采用截取8位当前日期数  + 4位随机整数)
         * @return
         */
        public static String getNonceStr() {
            //获得当前日期
            Date now = new Date();
            SimpleDateFormat outFormat = new SimpleDateFormat("yyyyMMddHHmmss");
            String currTime = outFormat.format(now);
            //截取8位
            String strTime = currTime.substring(8, currTime.length());
            //得到4位随机整数
            int num = 1;
            double random = Math.random();
            if (random < 0.1) {
                random = random + 0.1;
            }
            for (int i = 0; i < 4; i++) {
                num = num * 10;
            }
            num = (int)random * num;
            return strTime + num;
        }

        /**
         * 把数组所有元素排序，并按照“参数=参数值”的模式用“&”字符拼接成字符串
         * @param params 需要排序并参与字符拼接的参数组
         * @return 拼接后字符串
         */
        public static String createLinkString(Map<String, String> params) {
            List<String> keys = new ArrayList<String>(params.keySet());
            Collections.sort(keys);

            String prestr = "";

            for (int i = 0; i < keys.size(); i++) {
                String key = keys.get(i);
                String value = params.get(key);
                if (i == keys.size() - 1) {// 拼接时，不包括最后一个&字符
                    prestr = prestr + key + "=" + value;
                } else {
                    prestr = prestr + key + "=" + value + "&";
                }
            }
            return prestr;
        }

        /**
         * 除去数组中的空值和签名参数
         * @param sArray 签名参数组
         * @return 去掉空值与签名参数后的新签名参数组
         */
        public static Map<String, String> paraFilter(Map<String, String> sArray) {
            Map<String, String> result = new HashMap<String, String>();
            if (sArray == null || sArray.size() <= 0) {
                return result;
            }
            for (String key : sArray.keySet()) {
                String value = sArray.get(key);
                if (value == null || value.equals("") || key.equalsIgnoreCase("sign")
                        || key.equalsIgnoreCase("sign_type")) {
                    continue;
                }
                result.put(key, value);
            }
            return result;
        }

        /**
         * MD5 加密，转为指定类型
         * @param text
         * @param key
         * @param input_charset
         * @return
         */
        public static String sign(String text, String key, String input_charset) {
            text = text + "&key=" + key;
            return DigestUtils.md5Hex(getContentBytes(text, input_charset));
        }

        public static byte[] getContentBytes(String content, String charset) {
            if (charset == null || "".equals(charset)) {
                return content.getBytes();
            }
            try {
                return content.getBytes(charset);
            } catch (UnsupportedEncodingException e) {
                throw new RuntimeException("MD5签名过程中出现错误,指定的编码集不对,您目前指定的编码集是:" + charset);
            }
        }


        /**
         * 元转换成分
         * @return
         */
        public static String getMoney(String amount) {
            if(amount==null){
                return "";
            }
            // 金额转化为分为单位
            String currency =  amount.replaceAll("\\$|\\￥|\\,", "");  //处理包含, ￥ 或者$的金额
            int index = currency.indexOf(".");
            int length = currency.length();
            Long amLong = 0l;
            if(index == -1){
                amLong = Long.valueOf(currency+"00");
            }else if(length - index >= 3){
                amLong = Long.valueOf((currency.substring(0, index+3)).replace(".", ""));
            }else if(length - index == 2){
                amLong = Long.valueOf((currency.substring(0, index+2)).replace(".", "")+0);
            }else{
                amLong = Long.valueOf((currency.substring(0, index+1)).replace(".", "")+"00");
            }
            return amLong.toString();
        }

        /**
         * 解析xml得到 prepay_id 预支付id
         * @param result
         * @return
         * @throws DocumentException
         */
        public static String getPayNo(String result) throws DocumentException {
            Map<String, String> map = new HashMap<>();
            InputStream in = new ByteArrayInputStream(result.getBytes());
            SAXReader read = new SAXReader();
            Document doc = read.read(in);
            //得到xml根元素
            Element root = doc.getRootElement();
            //遍历  得到根元素的所有子节点
            @SuppressWarnings("unchecked")
            List<Element> list =root.elements();
            for(Element element:list){
                //装进map
                map.put(element.getName(), element.getText());
            }
            //返回码
            String return_code = map.get("return_code");
            //返回信息
            String result_code = map.get("result_code");
            //预支付id
            String prepay_id = "";
            //return_code 和result_code 都为SUCCESS 的时候返回 预支付id
            if(return_code.equals("SUCCESS")&&result_code.equals("SUCCESS")){
                prepay_id = map.get("prepay_id");
            }
            return prepay_id;
        }
        /**
         * 解析 回调时的xml装进map 返回
         * @param result
         * @return
         * @throws DocumentException
         */
        public static Map<String, String> getNotifyUrl(String result) throws DocumentException{
            Map<String, String> map = new HashMap<String, String>();
            InputStream in = new ByteArrayInputStream(result.getBytes());
            SAXReader read = new SAXReader();
            Document doc = read.read(in);
            //得到xml根元素
            Element root = doc.getRootElement();
            //遍历  得到根元素的所有子节点
            @SuppressWarnings("unchecked")
            List<Element> list =root.elements();
            for(Element element:list){
                //装进map
                map.put(element.getName().toString(), element.getText().toString());
            }
            return map;
        }

        /**
         * 验证签名，判断是否是从微信发过来
         * 验证方法：接收微信服务器回调我们url的时候传递的xml中的参数 然后再次加密，看是否与传递过来的sign签名相同
         * @param map
         * @return
         */
        public static boolean verifyWeixinNotify(Map<String, String> map,String key) {
            //根据微信服务端传来的各项参数 进行再一次加密后  与传过来的 sign 签名对比
            String signWx = map.get("sign");
            map.remove("sign");//重新获得签名一定要去除sign
            String mapStr = createLinkString(map);
            System.out.println("回调获得的数据组成mapStr" + mapStr);
            String signOwn = sign(mapStr, key, "utf-8").toUpperCase();         //根据微信端参数进行加密的签名
            System.out.println("回调获得的数据进行重新加密认证得到sign:" + signOwn);
                           //微信端传过来的签名
            if(signOwn.equals(signWx)){
                //如果两个签名一致，验证成功
                return true;
            }
            return false;
        }

        /**
         *
         * @param requestUrl
         * @param requestMethod
         * @param outputStr
         */
        public static String httpRequest(String requestUrl,String requestMethod,String outputStr){
            // 创建SSLContext
            StringBuffer buffer=null;
            try{
                URL url = new URL(requestUrl);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod(requestMethod);
                conn.setDoOutput(true);
                conn.setDoInput(true);
                conn.connect();

                //往服务器端写内容
                if(null !=outputStr){
                    OutputStream os=conn.getOutputStream();
                    os.write(outputStr.getBytes("utf-8"));
                    os.close();
                }
                // 读取服务器端返回的内容
                InputStream is = conn.getInputStream();
                InputStreamReader isr = new InputStreamReader(is, "utf-8");
                BufferedReader br = new BufferedReader(isr);
                buffer = new StringBuffer();
                String line = null;
                while ((line = br.readLine()) != null) {
                    buffer.append(line);
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            return buffer.toString();
        }









    public enum SignType {
        MD5, HMACSHA256
    }





    /**
     * 作用：统一下单<br>
     * 场景：公共号支付、扫码支付、APP支付
     * @param reqData 向wxpay post的请求数据
     * @param connectTimeoutMs 连接超时时间，单位是毫秒
     * @param readTimeoutMs 读超时时间，单位是毫秒
     * @return API返回数据
     * @throws Exception
     */
    public Map<String, String> unifiedOrder(Map<String, String> reqData,String key,  int connectTimeoutMs, int readTimeoutMs) throws Exception {
        String url = "https://api.mch.weixin.qq.com/pay/unifiedorder";

        String respXml = this.requestWithoutCert(url, reqData, connectTimeoutMs, readTimeoutMs);
        return this.processResponseXml(respXml,key);
    }



    /**
     * 处理 HTTPS API返回数据，转换成Map对象。return_code为SUCCESS时，验证签名。
     * @param xmlStr API返回的XML格式数据
     * @return Map类型数据
     * @throws Exception
     */
    public Map<String, String> processResponseXml(String xmlStr,String key) throws Exception {
        String RETURN_CODE = "return_code";
        String return_code;
        Map<String, String> respData = xmlToMap(xmlStr);
        if (respData.containsKey(RETURN_CODE)) {
            return_code = respData.get(RETURN_CODE);
        }
        else {
            throw new Exception(String.format("No `return_code` in XML: %s", xmlStr));
        }

        if (return_code.equals("FAIL")) {
            return respData;
        }
        else if (return_code.equals("SUCCESS")) {
            if (this.isResponseSignatureValid(respData,key)) {
                return respData;
            }
            else {
                throw new Exception(String.format("Invalid sign value in XML: %s", xmlStr));
            }
        }
        else {
            throw new Exception(String.format("return_code value %s is invalid in XML: %s", return_code, xmlStr));
        }
    }


    /**
     * 判断xml数据的sign是否有效，必须包含sign字段，否则返回false。
     *
     * @param reqData 向wxpay post的请求数据
     * @return 签名是否有效
     * @throws Exception
     */
    public boolean isResponseSignatureValid(Map<String, String> reqData,String key) throws Exception {
        // 返回数据的签名方式和请求中给定的签名方式是一致的
        return isSignatureValid(reqData, key, SignType.MD5);
    }


    /**
     * 判断签名是否正确，必须包含sign字段，否则返回false。
     *
     * @param data Map类型数据
     * @param key API密钥
     * @param signType 签名方式
     * @return 签名是否正确
     * @throws Exception
     */
    public static boolean isSignatureValid(Map<String, String> data, String key, SignType signType) throws Exception {
        if (!data.containsKey("sign") ) {
            return false;
        }
        String sign = data.get("sign");
        return generateSignature(data, key, signType).equals(sign);
    }


    /**
     * 生成签名. 注意，若含有sign_type字段，必须和signType参数保持一致。
     *
     * @param data 待签名数据
     * @param key API密钥
     * @param signType 签名方式
     * @return 签名
     */
    public static String generateSignature(final Map<String, String> data, String key, SignType signType) throws Exception {
        Set<String> keySet = data.keySet();
        String[] keyArray = keySet.toArray(new String[keySet.size()]);
        Arrays.sort(keyArray);
        StringBuilder sb = new StringBuilder();
        for (String k : keyArray) {
            if (k.equals("sign")) {
                continue;
            }
            if (data.get(k).trim().length() > 0) // 参数值为空，则不参与签名
                sb.append(k).append("=").append(data.get(k).trim()).append("&");
        }
        sb.append("key=").append(key);
        if (SignType.MD5.equals(signType)) {
            return MD5(sb.toString()).toUpperCase();
        }
        else if (SignType.HMACSHA256.equals(signType)) {
            return HMACSHA256(sb.toString(), key);
        }
        else {
            throw new Exception(String.format("Invalid sign_type: %s", signType));
        }
    }




    /**
     * 生成签名
     *
     * @param data 待签名数据
     * @param key API密钥
     * @return 签名
     */
    public static String generateSignature(final Map<String, String> data, String key) throws Exception {
        return generateSignature(data, key, SignType.MD5);
    }



    /**
     * 将Map转换为XML格式的字符串
     *
     * @param data Map类型数据
     * @return XML格式的字符串
     * @throws Exception
     */
    public static String mapToXml(Map<String, String> data) throws Exception {
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder= documentBuilderFactory.newDocumentBuilder();
        org.w3c.dom.Document document = documentBuilder.newDocument();
        org.w3c.dom.Element root = document.createElement("xml");
        document.appendChild(root);
        for (String key: data.keySet()) {
            String value = data.get(key);
            if (value == null) {
                value = "";
            }
            value = value.trim();
            org.w3c.dom.Element filed = document.createElement(key);
            filed.appendChild(document.createTextNode(value));
            root.appendChild(filed);
        }
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer transformer = tf.newTransformer();
        DOMSource source = new DOMSource(document);
        transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
        transformer.setOutputProperty(OutputKeys.INDENT, "yes");
        StringWriter writer = new StringWriter();
        StreamResult result = new StreamResult(writer);
        transformer.transform(source, result);
        String output = writer.getBuffer().toString(); //.replaceAll("\n|\r", "");
        try {
            writer.close();
        }
        catch (Exception ex) {
        }
        return output;
    }


    /**
     * XML格式字符串转换为Map
     *
     * @param strXML XML字符串
     * @return XML数据转换后的Map
     * @throws Exception
     */
    public static Map<String, String> xmlToMap(String strXML) throws Exception {
        Map<String, String> data = new HashMap<String, String>();
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder= documentBuilderFactory.newDocumentBuilder();
        InputStream stream = new ByteArrayInputStream(strXML.getBytes("UTF-8"));
        org.w3c.dom.Document doc = documentBuilder.parse(stream);
        doc.getDocumentElement().normalize();
        NodeList nodeList = doc.getDocumentElement().getChildNodes();
        for (int idx=0; idx<nodeList.getLength(); ++idx) {
            Node node = nodeList.item(idx);
            if (node.getNodeType() == Node.ELEMENT_NODE) {
                org.w3c.dom.Element element = (org.w3c.dom.Element) node;
                data.put(element.getNodeName(), element.getTextContent());
            }
        }
        try {
            stream.close();
        }
        catch (Exception ex) {

        }
        return data;
    }



    /**
     * 不需要证书的请求
     * @param strUrl String
     * @param reqData 向wxpay post的请求数据
     * @param connectTimeoutMs 超时时间，单位是毫秒
     * @param readTimeoutMs 超时时间，单位是毫秒
     * @return API返回数据
     * @throws Exception
     */
    public String requestWithoutCert(String strUrl, Map<String, String> reqData,
                                     int connectTimeoutMs, int readTimeoutMs) throws Exception {
        String UTF8 = "UTF-8";
        String reqBody = mapToXml(reqData);
        URL httpUrl = new URL(strUrl);
        HttpURLConnection httpURLConnection = (HttpURLConnection) httpUrl.openConnection();
        httpURLConnection.setDoOutput(true);
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setConnectTimeout(connectTimeoutMs);
        httpURLConnection.setReadTimeout(readTimeoutMs);
        httpURLConnection.connect();
        OutputStream outputStream = httpURLConnection.getOutputStream();
        outputStream.write(reqBody.getBytes(UTF8));
        //获取内容
        InputStream inputStream = httpURLConnection.getInputStream();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, UTF8));
        final StringBuffer stringBuffer = new StringBuffer();
        String line = null;
        while ((line = bufferedReader.readLine()) != null) {
            stringBuffer.append(line).append("\n");
        }
        String resp = stringBuffer.toString();
        if (stringBuffer!=null) {
            try {
                bufferedReader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (inputStream!=null) {
            try {
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (outputStream!=null) {
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return resp;
    }



    /**
     * 生成 MD5
     *
     * @param data 待处理数据
     * @return MD5结果
     */
    public static String MD5(String data) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] array = md.digest(data.getBytes("UTF-8"));
        StringBuilder sb = new StringBuilder();
        for (byte item : array) {
            sb.append(Integer.toHexString((item & 0xFF) | 0x100).substring(1, 3));
        }
        return sb.toString().toUpperCase();
    }

    /**
     * 生成 HMACSHA256
     * @param data 待处理数据
     * @param key 密钥
     * @return 加密结果
     * @throws Exception
     */
    public static String HMACSHA256(String data, String key) throws Exception {
        Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
        SecretKeySpec secret_key = new SecretKeySpec(key.getBytes("UTF-8"), "HmacSHA256");
        sha256_HMAC.init(secret_key);
        byte[] array = sha256_HMAC.doFinal(data.getBytes("UTF-8"));
        StringBuilder sb = new StringBuilder();
        for (byte item : array) {
            sb.append(Integer.toHexString((item & 0xFF) | 0x100).substring(1, 3));
        }
        return sb.toString().toUpperCase();
    }


    public static final String NOTIFY_SUCCESS = "<xml>\n" +
            "  <return_code><![CDATA[SUCCESS]]></return_code>\n" +
            "  <return_msg><![CDATA[OK]]></return_msg>\n" +
            "</xml>";
    public static final String NOTIFY_FAIL_SERVER_ERROR = "<xml>\n" +
            "  <return_code><![CDATA[FAIL]]></return_code>\n" +
            "  <return_msg><![CDATA[internal error occured!]]></return_msg>\n" +
            "</xml>";
    public static final String NOTIFY_FAIL_IO_ERROR = "<xml>\n" +
            "  <return_code><![CDATA[FAIL]]></return_code>\n" +
            "  <return_msg><![CDATA[IO EXCEPTION,输入流有问题]]></return_msg>\n" +
            "</xml>";
    public static final String NOTIFY_FAIL_WRONG_RETURN_CODE = "<xml>\n" +
            "  <return_code><![CDATA[FAIL]]></return_code>\n" +
            "  <return_msg><![无效的或者错误的return_code]]></return_msg>\n" +
            "</xml>";
    public static final String NOTIFY_FAIL_UNKNOWN_DATA = "<xml>\n" +
            "  <return_code><![CDATA[FAIL]]></return_code>\n" +
            "  <return_msg><![无法验证数据的合法性，请重新尝试]]></return_msg>\n" +
            "</xml>";
    }
