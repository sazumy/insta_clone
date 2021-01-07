InstaClone::Application.config.session_store :redis_store, expire_after: 90.minutes, servers: {
  host: 'localhost',
  port: 6379,
  namespace: 'user_sessions',
  signed: true,
  secure: true
}
