// app/scan-collector.jsx
import { View, Text, StyleSheet, TouchableOpacity } from "react-native"
import { useRouter } from "expo-router"
import { useState } from "react"
import { colors } from "../constants/colors"
import VerifyResult from "../components/VerifyResult"

export default function ScanCollector() {
  const router = useRouter()
  const [result, setResult] = useState(null)

  const handleScan = (isVerified) => {
    setResult(isVerified)
  }

  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.back} onPress={() => router.back()}>
        <Text style={styles.backText}>← Back</Text>
      </TouchableOpacity>
      <Text style={styles.title}>Verify Artwork</Text>
      <Text style={styles.sub}>Point your camera at the artwork to verify</Text>

      {result === null ? (
        <>
          <View style={styles.viewfinder}>
            <Text style={styles.viewfinderText}>[ Point camera at artwork ]</Text>
          </View>
          <TouchableOpacity style={styles.button} onPress={() => handleScan(true)}>
            <Text style={styles.buttonText}>Simulate Verified Scan</Text>
          </TouchableOpacity>
          <TouchableOpacity style={[styles.button, styles.dangerButton]} onPress={() => handleScan(false)}>
            <Text style={styles.buttonText}>Simulate Forgery Scan</Text>
          </TouchableOpacity>
        </>
      ) : (
        <>
          <VerifyResult
            verified={result}
            artistName="Amara Osei"
            artworkTitle="Aso-Oke Dreams"
          />
          <TouchableOpacity style={styles.button} onPress={() => setResult(null)}>
            <Text style={styles.buttonText}>Scan Another</Text>
          </TouchableOpacity>
        </>
      )}
    </View>
  )
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background, paddingHorizontal: 24, paddingTop: 60 },
  back: { marginBottom: 24 },
  backText: { color: colors.subtext, fontSize: 16 },
  title: { color: colors.cream, fontSize: 28, fontWeight: "800", marginBottom: 4 },
  sub: { color: colors.subtext, fontSize: 14, marginBottom: 32 },
  viewfinder: {
    width: "100%",
    height: 280,
    borderWidth: 2,
    borderColor: colors.secondary,
    borderRadius: 16,
    alignItems: "center",
    justifyContent: "center",
    marginBottom: 32,
    backgroundColor: colors.card,
  },
  viewfinderText: { color: colors.subtext, fontSize: 14 },
  button: { backgroundColor: colors.primary, padding: 18, borderRadius: 12, alignItems: "center", marginBottom: 12 },
  dangerButton: { backgroundColor: colors.danger },
  buttonText: { color: colors.cream, fontSize: 16, fontWeight: "700" },
})
