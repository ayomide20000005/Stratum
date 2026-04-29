// app/artwork.jsx
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, Image } from "react-native"
import { useRouter } from "expo-router"
import { colors } from "../constants/colors"

const CHAIN = ["Substrate", "Underpainting", "Build-up", "Signature", "Proof of Life"]

export default function Artwork() {
  const router = useRouter()

  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={true}>
      <TouchableOpacity style={styles.back} onPress={() => router.back()}>
        <Text style={styles.backText}>← Back</Text>
      </TouchableOpacity>
      <Image source={{ uri: "https://placehold.co/400x300/3D2314/F5ECD7?text=Artwork" }} style={styles.image} />
      <View style={styles.body}>
        <Text style={styles.title}>Aso-Oke Dreams</Text>
        <Text style={styles.artist}>by Amara Osei</Text>
        <Text style={styles.price}>₦ 2,400,000</Text>

        <Text style={styles.sectionTitle}>Chain of Custody</Text>
        {CHAIN.map((stage, index) => (
          <View key={index} style={styles.chainItem}>
            <Text style={styles.chainDot}>✓</Text>
            <View>
              <Text style={styles.chainStage}>Stage {index + 1} — {stage}</Text>
              <Text style={styles.chainDate}>Locked on 12 Apr 2025</Text>
            </View>
          </View>
        ))}

        <TouchableOpacity style={styles.button}>
          <Text style={styles.buttonText}>Contact Artist</Text>
        </TouchableOpacity>
      </View>
    </ScrollView>
  )
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background },
  back: { paddingHorizontal: 24, paddingTop: 60, marginBottom: 16 },
  backText: { color: colors.subtext, fontSize: 16 },
  image: { width: "100%", height: 260 },
  body: { padding: 24 },
  title: { color: colors.cream, fontSize: 26, fontWeight: "800", marginBottom: 4 },
  artist: { color: colors.subtext, fontSize: 15, marginBottom: 8 },
  price: { color: colors.primary, fontSize: 20, fontWeight: "700", marginBottom: 24 },
  sectionTitle: { color: colors.secondary, fontSize: 13, letterSpacing: 2, marginBottom: 16 },
  chainItem: { flexDirection: "row", alignItems: "flex-start", marginBottom: 14, gap: 12 },
  chainDot: { color: colors.verified, fontSize: 16, marginTop: 2 },
  chainStage: { color: colors.cream, fontSize: 14, fontWeight: "600" },
  chainDate: { color: colors.subtext, fontSize: 12, marginTop: 2 },
  button: { backgroundColor: colors.primary, padding: 18, borderRadius: 12, alignItems: "center", marginTop: 24 },
  buttonText: { color: colors.cream, fontSize: 16, fontWeight: "700" },
})
