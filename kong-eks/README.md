# kong-eks

    kubectl create secret generic kong-config-secret -n kong \
      --from-literal=portal_session_conf='{"storage":"kong","secret":"super_secret_salt_string","cookie_name":"portal_session","cookie_same_site":"Lax","cookie_secure":false}' \
      --from-literal=admin_gui_session_conf='{"storage":"kong","secret":"super_secret_salt_string","cookie_name":"admin_session","cookie_same_site":"Lax","cookie_secure":false}' \
      --from-literal=pg_host="enterprise-postgresql.kong.svc.cluster.local" \
      --from-literal=kong_admin_password=kong \
      --from-literal=password=kong