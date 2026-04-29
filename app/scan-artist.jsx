// app/scan-artist.jsx
import { View, Text, StyleSheet, TouchableOpacity, Alert } from "react-native"
import { useRouter } from "expo-router"
import { useState } from "react"
import { colors } from "../constants/colors"
import ProgressBar from "../components/ProgressBar"

const STAGE_LABELS = ["Substrate", "Underpainting", "Build-up", "Signature", "Proof of Life"]

export default function ScanArtist() {
  const router = useRouter()
  const [stage, setStage] = useState(0)

  const handleCapture = () => {
    if (stage < 4) {
      setStage(stage + 1)
      Alert.alert("Stage Locked", `${STAGE_LABELS[stage]} has been captured and locked into your ledger.`)
    } else {
      Alert.alert("Ledger Complete", "All 5 stages have been captured. Your artwork is now protected.", [
        { text: "Go to Dashboard", onPress: () => router.push("/dashboard") },
      ])
    }
  }

  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.back} onPress={() => router.back()}>
        <Text style={styles.backText}>← Back</Text>
      </TouchableOpacity>
      <Text style={styles.title}>New Ledger</Text>
      <Text style={styles.sub}>Capturing Stage {stage + 1} of 5</Text>

      <ProgressBar currentStage={stage} />

      <View style={styles.viewfinder}>
        <Text style={styles.viewfinderText}>[ Camera Viewfinder ]</Text>
        <Text style={styles.stageName}>{STAGE_LABELS[stage]}</Text>
      </View>

      <TouchableOpacity style={styles.button} onPress={handleCapture}>
        <Text style={styles.buttonText}>Capture Stage {stage + 1}</Text>
      </TouchableOpacity>

      <Text style={styles.hint}>Each scan locks this layer permanently into your ledger.</Text>
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
  stageName: { color: colors.cream, fontSize: 18, fontWeight: "700", marginTop: 8 },
  button: { backgroundColor: colors.primary, padding: 18, borderRadius: 12, alignItems: "center", marginBottom: 16 },
  buttonText: { color: colors.cream, fontSize: 16, fontWeight: "700" },
  hint: { color: colors.subtext, fontSize: 12, textAlign: "center" },
})
