// app/profile.jsx
import { View, Text, StyleSheet, TouchableOpacity } from "react-native"
import { useRouter } from "expo-router"
import { colors } from "../constants/colors"

export default function Profile() {
  const router = useRouter()

  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.back} onPress={() => router.back()}>
        <Text style={styles.backText}>← Back</Text>
      </TouchableOpacity>
      <View style={styles.avatar}>
        <Text style={styles.avatarText}>A</Text>
      </View>
      <Text style={styles.name}>Amara Osei</Text>
      <Text style={styles.role}>Artist</Text>
      <View style={styles.badge}>
        <Text style={styles.badgeText}>✓ Verified Artist</Text>
      </View>

      <View style={styles.stats}>
        <View style={styles.stat}>
          <Text style={styles.statNum}>3</Text>
          <Text style={styles.statLabel}>Works</Text>
        </View>
        <View style={styles.stat}>
          <Text style={styles.statNum}>2</Text>
          <Text style={styles.statLabel}>For Sale</Text>
        </View>
        <View style={styles.stat}>
          <Text style={styles.statNum}>15</Text>
          <Text style={styles.statLabel}>Scans</Text>
        </View>
      </View>

      <TouchableOpacity style={styles.kycButton} onPress={() => router.push("/kyc")}>
        <Text style={styles.kycText}>Manage Verification</Text>
      </TouchableOpacity>
    </View>
  )
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background, paddingHorizontal: 24, paddingTop: 60, alignItems: "center" },
  back: { alignSelf: "flex-start", marginBottom: 32 },
  backText: { color: colors.subtext, fontSize: 16 },
  avatar: { width: 80, height: 80, borderRadius: 40, backgroundColor: colors.primary, alignItems: "center", justifyContent: "center", marginBottom: 16 },
  avatarText: { color: colors.cream, fontSize: 32, fontWeight: "800" },
  name: { color: colors.cream, fontSize: 22, fontWeight: "800" },
  role: { color: colors.subtext, fontSize: 14, marginTop: 4 },
  badge: { marginTop: 12, backgroundColor: colors.verified + "22", paddingHorizontal: 16, paddingVertical: 6, borderRadius: 20, borderWidth: 1, borderColor: colors.verified },
  badgeText: { color: colors.verified, fontSize: 13, fontWeight: "600" },
  stats: { flexDirection: "row", gap: 40, marginTop: 40 },
  stat: { alignItems: "center" },
  statNum: { color: colors.cream, fontSize: 28, fontWeight: "800" },
  statLabel: { color: colors.subtext, fontSize: 13, marginTop: 4 },
  kycButton: { marginTop: 40, borderWidth: 1, borderColor: colors.brown, borderRadius: 12, paddingVertical: 14, paddingHorizontal: 32 },
  kycText: { color: colors.subtext, fontSize: 15 },
})
