ActionMailer::Base.smtp_settings = {
  address: Figaro.env.email_server,
  port: Figaro.env.email_port,
  user_name: Figaro.env.email_user_name,
  password: Figaro.env.email_password,
  authentication: :plain,
  enable_starttls_auto: true,
  openssl_verify_mode: 'none'
}