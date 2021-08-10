rm -rf hardware/qcom-caf/msm8916/audio
rm -rf hardware/qcom-caf/msm8916/display 
rm -rf hardware/qcom-caf/msm8916/media
echo "delete hals"
git clone https://github.com/LineageOS/android_hardware_qcom_display -b lineage-18.1-caf-msm8916 hardware/qcom-caf/msm8916/display
git clone https://github.com/LineageOS/android_hardware_qcom_media -b lineage-18.1-caf-msm8916 hardware/qcom-caf/msm8916/media
git clone https://github.com/LineageOS/android_hardware_qcom_audio -b lineage-18.1-caf-msm8916 hardware/qcom-caf/msm8916/audio
echo "cloned hals"