{
  services.sing-box = {
    settings = {
	    log = {
	    	level = "debug";
	    };
	    inbounds = [
	    	{
	    		type = "vless";
	    		tag = "vless-in";
	    		listen = "::";
	    		listen_port = 443;
	    		users = [
	    			{
	    				name = "homepc";
	    				uuid = "def076cb-4b9b-4e54-8fb9-a3daa3d95acd";
	    				flow = "xtls-rprx-vision";
	    			}
	    			{
	    				name = "homelab";
	    				uuid = "94450798-60ef-41d7-9a21-dccf23f7e10a";
	    				flow = "xtls-rprx-vision";
	    			}
	    			{
	    				name = "laptop";
	    				uuid = "ff7fa625-102c-40d3-8d65-c3380f45693f";
	    				flow = "xtls-rprx-vision";
	    			}
	    			{
	    				name = "android_phone";
	    				uuid = "0ad2a2ec-88cc-4964-8c17-14098b575e8e";
	    				flow = "xtls-rprx-vision";
	    			}
	    		];
	    		tls = {
	    			enabled = true;
	    			server_name = "www.google.com";
	    			reality = {
	    				enabled = true;
	    				handshake = {
	    					server = "www.google.com";
	    					server_port = 443;
	    				};
	    				private_key = "-M3rr40l1Jsrk8tTMZvD-eFwX6kisHsoloc3bM5M1VQ";
	    				short_id = [
	    					"5596419832ef245d"
	    				];
	    			};
	    		};
	    		multiplex = {
	    			enabled = false;
	    			padding = true;
	    			brutal = {
	    				enabled = false;
	    				up_mbps = 1000;
	    				down_mbps = 1000;
	    			};
	    		};
	    	}
	    ];
	    outbounds = [
	    	{
	    		type = "direct";
	    		tag = "direct";
	    	}
	    ];
    };
  };
}
