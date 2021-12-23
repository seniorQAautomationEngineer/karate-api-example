function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
    var apiUrl;
    var dataSource;

    if (!env) {
        env = 'qa';
    }
    if (env === 'qa') {
        apiUrl ='http://jsonplaceholder.typicode.com'
        dataSource = 'qa'
    }
    if (env === 'uat') {
        apiUrl ='http://jsonplaceholder.uat.typicode.com'
        dataSource = 'uat'
    }

    var config = {
        apiUrl, env, dataSource
    }

    karate.configure('ssl', true);
    return config;
}