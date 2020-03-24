function jump(ms)
  
  system(['adb shell input swipe ' num2str(randi(200)+100) ' 300 400 300 ', num2str(int32(ms))]);
  end