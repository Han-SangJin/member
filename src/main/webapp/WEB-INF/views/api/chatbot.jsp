<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>chatbotTest demo</title>
    <script src="https://unpkg.com/vue"></script>
    <script src="/sources/static/chatbotTest.umd.min.js"></script>
    <link rel="stylesheet" href="/sources/static/chatbotTest.css">
</head>
<body>
  <div id="app"></div>
 

<script type="text/javascript" src="./CryptoJS/rollups/hmac-sha256.js"></script>
<script type="text/javascript" src="./CryptoJS/components/enc-base64.js"></script>
 <script type="text/javascript">
function makeSignature() {
    var space = " ";                // one space
    var newLine = "\n";                // new line
    var method = "GET";                // method
    var url = "https://6fae325bc45948b8a409c7953042db27.apigw.ntruss.com/custom/v1/3633/e35da960b323d1fc5825fcc4a5332a3e94fb68dbe72f44832c270f2b02d7f871";    // url (include query string)
    var timestamp = "{timestamp}";            // current timestamp (epoch)
    var accessKey = "{accessKey}"            // access key id (from portal or sub account)
    var secretKey = "{bFljRmxzcGhZYUJ1c3lkQ25FblZST1FIbklxUWF4cEM=}";            // secret key (from portal or sub account)
 	
    var hmac = CryptoJS.algo.HMAC.create(CryptoJS.algo.SHA256, secretKey);
    hmac.update(method);
    hmac.update(space);
    hmac.update(url);
    hmac.update(newLine);
    hmac.update(timestamp);
    hmac.update(newLine);
    hmac.update(accessKey);

    var hash = hmac.finalize();

    return hash.toString(CryptoJS.enc.Base64);
}
 </script> 
  
  
  
  
  
  
  
  
  
  
  
  <script type="text/javascript">
    window.onload=function () {
      const chatBot = chatbotTest.build({
        el: '#app',
        apiUrl: '/messenger-api',
        apiVersion: 'v2',
        apiToken: 'QXBNa1lOdVZTaHN3cURzd2hwcHdlTUNlb1phS1ZPekc=',
        log: true,
        callbacks: {
          success: function (res) {
            const question = res[0];
            const answer = res[1];
            console.log('test reply question : ', question);
            console.log('test reply answer : ', answer);
          },
          error: function (err) {
            console.log('test reply error response: ', err);
          }
        }
      });
      chatBot.sendParamsConfig('open');
    }
  </script>
</body>
</html>
