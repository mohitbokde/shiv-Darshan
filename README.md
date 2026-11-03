# 🔱 शिव दर्शन (Made by Mohit)

## Stage 1 में क्या है
- सुनहरा त्रिशूल और "हर हर महादेव" वाली स्प्लैश स्क्रीन (3 सेकंड बाद अपने-आप होम खुलता है)
- होम स्क्रीन: आज की तारीख, आज का संस्कृत मंत्र (हिंदी अर्थ के साथ, कॉपी बटन), आज की शिव कथा
- पूरी कथा वाली स्क्रीन (जीवन की सीख के साथ)
- परिचय स्क्रीन: Made by Mohit
- मंत्र और कथा रोज़ रात 12 बजे अपने-आप बदलते हैं (ऐप के अंदर से, इंटरनेट नहीं चाहिए)

## Termux से GitHub पर डालना
```
pkg update -y && pkg install -y git unzip
termux-setup-storage
cd ~
cp ~/storage/downloads/shiv_darshan.zip .
unzip shiv_darshan.zip
cd shiv_darshan
git init
git branch -M main
git add .
git commit -m "Stage 1"
git remote add origin https://github.com/आपका-यूज़रनेम/shiv-darshan.git
git push -u origin main
```
(पहले GitHub पर `shiv-darshan` नाम की खाली repository बना लें। पासवर्ड की जगह Personal Access Token डालना होगा।)

## APK कैसे मिलेगा
1. GitHub पर repository खोलें, **Actions** टैब में जाएँ।
2. "Build APK" चलता दिखेगा। 5-10 मिनट रुकें, हरा ✔ आने पर उस पर टैप करें।
3. नीचे **Artifacts** में `shiv-darshan-apk` डाउनलोड करें, ZIP खोलें, `app-release.apk` इंस्टॉल करें।
