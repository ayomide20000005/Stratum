// app/role-select.jsx
import { View, Text, StyleSheet, TouchableOpacity } from "react-native"
import { useRouter } from "expo-router"
import { colors } from "../constants/colors"

const ROLES = [
  { key: "artist", title: "Artist", desc: "Register and protect your work" },
  { key: "collector", title: "Collector", desc: "Verify before you buy" },
  { key: "institution", title: "Institution", desc: "Authenticate and co-sign" },
]

export default function RoleSelect() {
  const router = useRouter()

  const handleRole = (role) => {
    router.push({ pathname: "/home", params: { role } })
  }

  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.back} onPress={() => router.back()}>
        <Text style={styles.backText}>← Back</Text>
      </TouchableOpacity>
      <Text style={styles.title}>Who are you?</Text>
      <Text style={styles.sub}>Select your role to continue</Text>
      {ROLES.map((role) => (
        <TouchableOpacity key={role.key} style={styles.card} onPress={() => handleRole(role.key)}>
          <Text style={styles.roleTitle}>{role.title}</Text>
          <Text style={styles.roleDesc}>{role.desc}</Text>
        </TouchableOpacity>
      ))}
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
    paddingHorizontal: 24,
    paddingTop: 60,
  },
  back: { marginBottom: 32 },
  backText: { color: colors.subtext, fontSize: 16 },
  title: { color: colors.cream, fontSize: 32, fontWeight: "800", marginBottom: 8 },
  sub: { color: colors.subtext, fontSize: 14, marginBottom: 32 },
  card: {
    backgroundColor: colors.card,
    borderRadius: 14,
    padding: 20,
    marginBottom: 16,
    borderWidth: 1,
    borderColor: colors.brown,
  },
  roleTitle: { color: colors.cream, fontSize: 18, fontWeight: "700", marginBottom: 4 },
  roleDesc: { color: colors.subtext, fontSize: 14 },
})
