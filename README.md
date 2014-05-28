uber-hack
=========

A Ruby Frontend to the private Uber API

We proxied the traffic coming from the Über app so we could see the private endpoints they were using, this allowed us to reverse the API and develop our own public frontend to this private API. We use this frontend to create a web app which has a realtime map showing the location of Uber cabs in 6 cities (New York, Atlanta, San Francisco, Los Angeles, London and their secret location Shanghai)

How to use
=========

You can either use our website to view them in realtime, or if you want to use your own tokens and create your own app with the Uber API then you need to find out your token and deviceID.   
    
To find your token and device ID:     

<<<<<<< HEAD
1. Use a proxy tool to proxy the traffic from your iPhone/Android device (I recommend Charles (http://www.charlesproxy.com)).  
=======
1. Use a proxy tool to proxy the traffic from your iPhone/Android device (I recommend Charles (http://www.charlesproxy.com).  
>>>>>>> 1e191aace59cf101c7081a10dc59384d8316a586
2. Set your device to use this proxy, open the Uber app and look for a cab.   
3. In Charles you should see some endpoints appear for IP addresses, look in them until you find one requesting "default" (/), look at the request data and you will find your token and deviceID.
4. Add these as the environment variables (uberdevid and ubertoken).  

