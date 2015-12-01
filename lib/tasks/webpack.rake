namespace :webpack do
  task :hot do
    sh 'cd client && npm start'
  end
end

task :webpack do
  sh 'rm app/assets/javascripts/generated/* || true && cd client && npm run build:dev:client'
end
