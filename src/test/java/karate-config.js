function() {   
	var config={}
	var env = karate.properties['karate.env'];
	karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'local';
  }
  config = {
		    productbaseUrl: 'http://localhost:3001',
		    productreviewbaseUrl: 'http://localhost:3002'

  };
  if (env == 'ST') {
		    config.productbaseUrl = 'http://localhost:3001',
		    config.productreviewbaseUrl = 'http://localhost:3002',
		    config.environment = env
  }
  karate.log('karate.env system property was:', env);
  karate.configure('connectTimeout', 100000);
  karate.configure('readTimeout', 100000);
  return config;
}