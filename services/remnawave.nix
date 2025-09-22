# Auto-generated using compose2nix v0.3.1.
{ pkgs, lib, ... }:

{
  # Runtime
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    dockerCompat = true;
    defaultNetwork.settings = {
      # Required for container networking to be able to use names.
      dns_enabled = true;
    };
  };

  # Enable container name DNS for non-default Podman networks.
  # https://github.com/NixOS/nixpkgs/issues/226365
  networking.firewall.interfaces."podman+".allowedUDPPorts = [ 53 ];

  virtualisation.oci-containers.backend = "podman";

  # Containers
  virtualisation.oci-containers.containers."remnawave" = {
    image = "remnawave/backend:2";
    environment = {
      "API_INSTANCES" = "1";
      "APP_PORT" = "3000";
      "BANDWIDTH_USAGE_NOTIFICATIONS_ENABLED" = "false";
      "BANDWIDTH_USAGE_NOTIFICATIONS_THRESHOLD" = "[60, 80]";
      "CLOUDFLARE_TOKEN" = "ey...";
      "DATABASE_URL" = "postgresql://postgres:ccf417662c6c78409853460a3cd037afa3200bb35c5aa671@remnawave-db:5432/postgres";
      "FRONT_END_DOMAIN" = "somekindofskibidirizzerblog.fun";
      "HWID_DEVICE_LIMIT_ENABLED" = "false";
      "IS_DOCS_ENABLED" = "false";
      "IS_TELEGRAM_NOTIFICATIONS_ENABLED" = "false";
      "JWT_API_TOKENS_SECRET" = "d110fb3e43275064b581232db35529491c90304a4a7a1c23b4829a67e392e3f91cb9006960aeaf8bc9d97a1c40dc074465937b2ad00073c60e92a9bbcb7efd36";
      "JWT_AUTH_SECRET" = "e1c9cc76534cd57e1b4c97a7b3d0a4be4bdeae83b8b5994b08a4152b6e96b2b5e37c80dba19d9edfda5222c535ff3868b364066102790080ef8e30ac216f4bdf";
      "METRICS_PASS" = "780430522c8c269300c1b20b4c547034e309abc20f32ca5218a10f7ca679926fa284e03f88386eedf2b2948235cbb26dc921e8a6380c20c519a33f8a942480ff";
      "METRICS_PORT" = "3001";
      "METRICS_USER" = "admin";
      "POSTGRES_DB" = "postgres";
      "POSTGRES_PASSWORD" = "ccf417662c6c78409853460a3cd037afa3200bb35c5aa671";
      "POSTGRES_USER" = "postgres";
      "REDIS_HOST" = "remnawave-redis";
      "REDIS_PORT" = "6379";
      "SCALAR_PATH" = "/scalar";
      "SUB_PUBLIC_DOMAIN" = "somekindofskibidirizzerblog.fun/api/sub";
      "SWAGGER_PATH" = "/docs";
      "TELEGRAM_BOT_TOKEN" = "change_me";
      "TELEGRAM_NOTIFY_CRM_CHAT_ID" = "change_me";
      "TELEGRAM_NOTIFY_CRM_THREAD_ID" = "";
      "TELEGRAM_NOTIFY_NODES_CHAT_ID" = "change_me";
      "TELEGRAM_NOTIFY_NODES_THREAD_ID" = "";
      "TELEGRAM_NOTIFY_USERS_CHAT_ID" = "change_me";
      "TELEGRAM_NOTIFY_USERS_THREAD_ID" = "";
      "TELEGRAM_OAUTH_ADMIN_IDS" = "[123, 321]";
      "TELEGRAM_OAUTH_ENABLED" = "false";
      "WEBHOOK_ENABLED" = "false";
      "WEBHOOK_SECRET_HEADER" = "b9ad458dbe27fac21d638c64b4e4976169ee119a7da75742cec179e8260edd7a8fb72b3da50bd0d68c0f8a2f4e24a87aa4baefde3fed464fada959a1846f84a9";
      "WEBHOOK_URL" = "https://webhook.site/1234567890";
    };
    environmentFiles = [
      "/d/prog/nixosSingBoxGermany/data/.env"
    ];
    ports = [
      "127.0.0.1:3000:3000/tcp"
    ];
    dependsOn = [
      "remnawave-db"
      "remnawave-redis"
    ];
    log-driver = "journald";
    extraOptions = [
      "--health-cmd=curl -f http://localhost:3001/health"
      "--health-interval=30s"
      "--health-retries=3"
      "--health-start-period=30s"
      "--health-timeout=5s"
      "--hostname=remnawave"
      "--network-alias=remnawave"
      "--network=remnawave-network"
    ];
  };
  systemd.services."podman-remnawave" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-remnawave-network.service"
    ];
    requires = [
      "podman-network-remnawave-network.service"
    ];
    partOf = [
      "podman-compose-remnawave-root.target"
    ];
    wantedBy = [
      "podman-compose-remnawave-root.target"
    ];
  };
  virtualisation.oci-containers.containers."remnawave-db" = {
    image = "postgres:17.6";
    environment = {
      "API_INSTANCES" = "1";
      "APP_PORT" = "3000";
      "BANDWIDTH_USAGE_NOTIFICATIONS_ENABLED" = "false";
      "BANDWIDTH_USAGE_NOTIFICATIONS_THRESHOLD" = "[60, 80]";
      "CLOUDFLARE_TOKEN" = "ey...";
      "DATABASE_URL" = "postgresql://postgres:ccf417662c6c78409853460a3cd037afa3200bb35c5aa671@remnawave-db:5432/postgres";
      "FRONT_END_DOMAIN" = "somekindofskibidirizzerblog.fun";
      "HWID_DEVICE_LIMIT_ENABLED" = "false";
      "IS_DOCS_ENABLED" = "false";
      "IS_TELEGRAM_NOTIFICATIONS_ENABLED" = "false";
      "JWT_API_TOKENS_SECRET" = "d110fb3e43275064b581232db35529491c90304a4a7a1c23b4829a67e392e3f91cb9006960aeaf8bc9d97a1c40dc074465937b2ad00073c60e92a9bbcb7efd36";
      "JWT_AUTH_SECRET" = "e1c9cc76534cd57e1b4c97a7b3d0a4be4bdeae83b8b5994b08a4152b6e96b2b5e37c80dba19d9edfda5222c535ff3868b364066102790080ef8e30ac216f4bdf";
      "METRICS_PASS" = "780430522c8c269300c1b20b4c547034e309abc20f32ca5218a10f7ca679926fa284e03f88386eedf2b2948235cbb26dc921e8a6380c20c519a33f8a942480ff";
      "METRICS_PORT" = "3001";
      "METRICS_USER" = "admin";
      "POSTGRES_DB" = "postgres";
      "POSTGRES_PASSWORD" = "ccf417662c6c78409853460a3cd037afa3200bb35c5aa671";
      "POSTGRES_USER" = "postgres";
      "REDIS_HOST" = "remnawave-redis";
      "REDIS_PORT" = "6379";
      "SCALAR_PATH" = "/scalar";
      "SUB_PUBLIC_DOMAIN" = "somekindofskibidirizzerblog.fun/api/sub";
      "SWAGGER_PATH" = "/docs";
      "TELEGRAM_BOT_TOKEN" = "change_me";
      "TELEGRAM_NOTIFY_CRM_CHAT_ID" = "change_me";
      "TELEGRAM_NOTIFY_CRM_THREAD_ID" = "";
      "TELEGRAM_NOTIFY_NODES_CHAT_ID" = "change_me";
      "TELEGRAM_NOTIFY_NODES_THREAD_ID" = "";
      "TELEGRAM_NOTIFY_USERS_CHAT_ID" = "change_me";
      "TELEGRAM_NOTIFY_USERS_THREAD_ID" = "";
      "TELEGRAM_OAUTH_ADMIN_IDS" = "[123, 321]";
      "TELEGRAM_OAUTH_ENABLED" = "false";
      "TZ" = "UTC";
      "WEBHOOK_ENABLED" = "false";
      "WEBHOOK_SECRET_HEADER" = "b9ad458dbe27fac21d638c64b4e4976169ee119a7da75742cec179e8260edd7a8fb72b3da50bd0d68c0f8a2f4e24a87aa4baefde3fed464fada959a1846f84a9";
      "WEBHOOK_URL" = "https://webhook.site/1234567890";
    };
    environmentFiles = [
      "/d/prog/nixosSingBoxGermany/data/.env"
    ];
    volumes = [
      "remnawave-db-data:/var/lib/postgresql/data:rw"
    ];
    ports = [
      "127.0.0.1:6767:5432/tcp"
    ];
    log-driver = "journald";
    extraOptions = [
      "--health-cmd=pg_isready -U \${POSTGRES_USER} -d \${POSTGRES_DB}"
      "--health-interval=3s"
      "--health-retries=3"
      "--health-timeout=10s"
      "--hostname=remnawave-db"
      "--network-alias=remnawave-db"
      "--network=remnawave-network"
    ];
  };
  systemd.services."podman-remnawave-db" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-remnawave-network.service"
      "podman-volume-remnawave-db-data.service"
    ];
    requires = [
      "podman-network-remnawave-network.service"
      "podman-volume-remnawave-db-data.service"
    ];
    partOf = [
      "podman-compose-remnawave-root.target"
    ];
    wantedBy = [
      "podman-compose-remnawave-root.target"
    ];
  };
  virtualisation.oci-containers.containers."remnawave-redis" = {
    image = "valkey/valkey:8.1-alpine";
    environmentFiles = [
      "/d/prog/nixosSingBoxGermany/data/.env"
    ];
    volumes = [
      "remnawave-redis-data:/data:rw"
    ];
    log-driver = "journald";
    extraOptions = [
      "--health-cmd=[\"valkey-cli\", \"ping\"]"
      "--health-interval=3s"
      "--health-retries=3"
      "--health-timeout=10s"
      "--hostname=remnawave-redis"
      "--network-alias=remnawave-redis"
      "--network=remnawave-network"
    ];
  };
  systemd.services."podman-remnawave-redis" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-remnawave-network.service"
      "podman-volume-remnawave-redis-data.service"
    ];
    requires = [
      "podman-network-remnawave-network.service"
      "podman-volume-remnawave-redis-data.service"
    ];
    partOf = [
      "podman-compose-remnawave-root.target"
    ];
    wantedBy = [
      "podman-compose-remnawave-root.target"
    ];
  };

  # Networks
  systemd.services."podman-network-remnawave-network" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStop = "podman network rm -f remnawave-network";
    };
    script = ''
      podman network inspect remnawave-network || podman network create remnawave-network --driver=bridge
    '';
    partOf = [ "podman-compose-remnawave-root.target" ];
    wantedBy = [ "podman-compose-remnawave-root.target" ];
  };

  # Volumes
  systemd.services."podman-volume-remnawave-db-data" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect remnawave-db-data || podman volume create remnawave-db-data --driver=local
    '';
    partOf = [ "podman-compose-remnawave-root.target" ];
    wantedBy = [ "podman-compose-remnawave-root.target" ];
  };
  systemd.services."podman-volume-remnawave-redis-data" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect remnawave-redis-data || podman volume create remnawave-redis-data --driver=local
    '';
    partOf = [ "podman-compose-remnawave-root.target" ];
    wantedBy = [ "podman-compose-remnawave-root.target" ];
  };

  # Root service
  # When started, this will automatically create all resources and start
  # the containers. When stopped, this will teardown all resources.
  systemd.targets."podman-compose-remnawave-root" = {
    unitConfig = {
      Description = "Root target generated by compose2nix.";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
