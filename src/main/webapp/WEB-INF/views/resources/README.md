# chatbot-test-examples

We provide the public resources and html demo.

If you use nginx, there also is a simple rewrite config.

Load static resources.
```
  <script src="https://unpkg.com/vue"></script>
  <script src="./static/chatbotTest.umd.min.js"></script>
  <link rel="stylesheet" href="./static/chatbotTest.css">
```

Initialization
```
window.onload = function () {
  const chatBot = chatbotTest.build({
    el: '#app',
    apiUrl: '/messenger-api',
    apiVersion: 'v2',
    apiToken: '***'
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
  chatBot.toggleQuestion() //hidden question
  chatBot.sendParamsConfig(eventType, msg)
};
```
nginx configuration

> proxy_pass url: api gateway url

```
location /messenger-api {
  rewrite ^/messenger-api/(.*)$ break;
  proxy_pass https://nmjlavjic6.apigw.ntruss.com/1035-message/beta/;
}
```
