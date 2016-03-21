namespace :webpack do
  task :development do
    sh 'rm app/assets/webpack/* || true && cd client && npm run build:dev:client'
    sh 'cd client && npm run build:dev:server'
  end

  task :production do
    sh 'rm app/assets/webpack/* || true && cd client && npm run build:client'
    sh 'cd client && npm run build:server'
  end
end

task :webpack do
  sh 'foreman start -f Procfile.dev'
end
