#!/system/bin/sh

# Modelo spoofado (Pixel 7 Pro)
MODEL="Pixel 7 Pro"
MANUFACTURER="Google"
DEVICE="cheetah"
BRAND="google"
FINGERPRINT="google/cheetah/cheetah:14/UD1A.230803.041.A1/10145638:user/release-keys"

# Spoofar para todos os apps — isso força AOSP look no Android Auto
resetprop ro.product.model "$MODEL"
resetprop ro.product.manufacturer "$MANUFACTURER"
resetprop ro.product.device "$DEVICE"
resetprop ro.product.brand "$BRAND"
resetprop ro.build.fingerprint "$FINGERPRINT"

# Spoofar por pacote (redundante, mas garante)
PACKAGES="
com.google.android.projection.gearhead
com.android.vending
com.google.android.gms
com.google.android.googlequicksearchbox
com.google.android.tts
com.google.android.apps.googleassistant
com.google.android.inputmethod.latin
com.google.android.gms.inputmethod.voice
"

for pkg in $PACKAGES; do
    resetprop --package "$pkg" ro.product.model "$MODEL"
    resetprop --package "$pkg" ro.product.manufacturer "$MANUFACTURER"
    resetprop --package "$pkg" ro.product.device "$DEVICE"
    resetprop --package "$pkg" ro.product.brand "$BRAND"
    resetprop --package "$pkg" ro.build.fingerprint "$FINGERPRINT"
done