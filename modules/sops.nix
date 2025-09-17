{
	sops = {
		validateSopsFiles = false;
		age.keyFile = "/root/.config/sops/age/keys.txt";
		defaultSopsFile = "/etc/nixos/secrets/secrets.yaml";
		defaultSopsFormat = "yaml";
		secrets = {
			prowlarrIndexers = {
				sopsFile = "/etc/nixos/secrets/indexers.enc";
				format = "binary";
				mode = "0400";
			};
			# commented out cause nextcloud is disabled currently
			# "nextcloud_password" = {
			# 	owner = "nextcloud";
			# };
			"soulseek_environment" = {
				owner = "slskd";
			};
			"deluge_password" = {
				mode = "0440";
			};
			"miniflux_admin_credentials" = {};
			"radarr_api" = {
				group = "radarr";
				mode = "0440";
			};
			"radarr_environment" = {
				group = "radarr";
			};
			"sonarr_api" = {
				group = "sonarr";
				mode = "0440";
			};
			"readarr_api" = {};
			"lidarr_api" = {};
			"whisparr_api" = {};
			"bazarr_api" = {};
			"prowlarr_api" = {};
			"sabnzbd.ini" = { 
				owner = "sabnzbd";
				mode = "0660";
			};
			"sabnzbd_api" = {
				mode = "0444";
			};
			"kavita_token" = { 
			};
			"deluge_auth" = { 
				owner = "deluge";
				mode = "0440";
			};
			"freshrss_password" = { 
			};
			"gitlab_secret" = { 
				owner = "gitlab";
			};
			"gitlab_password" = { 
				owner = "gitlab";
			};
			"gitlab_db" = { 
				owner = "gitlab";
			};
			"gitlab_otp" = { 
				owner = "gitlab";
			};
			"gitlab_jws" = { 
				owner = "gitlab";
			};
			"gitlab_active_record_primary_key" = { 
				owner = "gitlab";
			};
			"gitlab_active_record_deterministic_key" = { 
				owner = "gitlab";
			};
			"gitlab_active_record_salt_key" = { 
				owner = "gitlab";
			};
			"gitlab_initial_root_password" = {
				owner = "gitlab";
			};
			"gns3_password" = {};
			"discourse_admin_password" = { 
				owner = "discourse";
			};
			"discourse_secret" = { 
				owner = "discourse";
			};
		};
	};
}
