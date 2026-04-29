// app/kyc.jsx
import { View, Text, StyleSheet, TouchableOpacity, Alert } from "react-native"
import { useRouter } from "expo-router"
import { colors } from "../constants/colors"

export default function KYC() {
  const router = useRouter()

  const handleIDUpload = () => {
    Alert.alert("ID Uploaded", "Your government ID has been submitted for review.")
  }

  const handleLiveness = () => {
    Alert.alert("Liveness Check", "Facial scan complete. Verification pending approval.")
  }

  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.back} onPress={() => router.back()}>
        <Text style={styles.backText}>← Back</Text>
      </TouchableOpacity>
      <Text style={styles.title}>Get Verified</Text>
      <Text style={styles.sub}>Complete both steps to receive your Verified Artist badge</Text>

      <View style={styles.step}>
        <Text style={styles.stepNum}>01</Text>
        <View style={styles.stepBody}>
          <Text style={styles.stepTitle}>Government ID</Text>
          <Text style={styles.stepDesc}>Upload a valid national ID, passport, or drivers license</Text>
          <TouchableOpacity style={styles.stepButton} onPress={handleIDUpload}>
            <Text style={styles.stepButtonText}>Upload ID</Text>
          </TouchableOpacity>
        </View>
      </View>

      <View style={styles.step}>
        <Text style={styles.stepNum}>02</Text>
        <View style={styles.stepBody}>
          <Text style={styles.stepTitle}>Liveness Facial Scan</Text>
          <Text style={styles.stepDesc}>A quick face scan to confirm you are a real person</Text>
          <TouchableOpacity style={styles.stepButton} onPress={handleLiveness}>
            <Text style={styles.stepButtonText}>Start Face Scan</Text>
          </TouchableOpacity>
        </View>
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background, paddingHorizontal: 24, paddingTop: 60 },
  back: { marginBottom: 24 },
  backText: { color: colors.subtext, fontSize: 16 },
  title: { color: colors.cream, fontSize: 28, fontWeight: "800", marginBottom: 8 },
  sub: { color: colors.subtext, fontSize: 14, marginBottom: 40, lineHeight: 22 },
  step: { flexDirection: "row", marginBottom: 32, gap: 16 },
  stepNum: { color: colors.primary, fontSize: 32, fontWeight: "800" },
  stepBody: { flex: 1 },
  stepTitle: { color: colors.cream, fontSize: 16, fontWeight: "700", marginBottom: 6 },
  stepDesc: { color: colors.subtext, fontSize: 13, lineHeight: 20, marginBottom: 12 },
  stepButton: { backgroundColor: colors.card, borderWidth: 1, borderColor: colors.brown, borderRadius: 10, paddingVertical: 12, paddingHorizontal: 20, alignSelf: "flex-start" },
  stepButtonText: { color: colors.cream, fontSize: 14, fontWeight: "600" },
})
