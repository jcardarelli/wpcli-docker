wp config create --path=${wp_dir} --url=${wp_url} --dbhost=database:3306 --dbname=${wp_db_name} --dbuser=${wp_db_user} 
wp core install --path=${wp_dir} --url=${wp_url} --title=${wp_title} --admin_user=${wp_admin_user} --admin_password=${wp_admin_pass} --admin_email=${wp_admin_email} 
