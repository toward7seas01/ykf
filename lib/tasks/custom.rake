task :gs1 do
  system("git instaweb --httpd=webrick --port=8627")
end

task :gs2 do
  system("git instaweb --httpd=webrick --stop")
end