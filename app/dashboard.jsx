// app/dashboard.jsx
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, Switch } from "react-native"
import { useRouter } from "expo-router"
import { useState } from "react"
import { colors } from "../constants/colors"

const MOCK_WORKS = [
  { id: "1", title: "Aso-Oke Dreams", stages: 5, forSale: true },
  { id: "2", title: "Lagos at Dusk", stages: 3, forSale: false },
  { id: "3", title: "The Griot", stages: 5, forSale: true },
]

export default function Dashboard() {
  const router = useRouter()
  const [works, setWorks] = useState(MOCK_WORKS)

  const toggleSale = (id) => {
    setWorks(works.map((w) => (w.id === id ? { ...w, forSale: !w.forSale } : w)))
  }

  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.back} onPress={() => router.back()}>
        <Text style={styles.backText}>← Back</Text>
      </TouchableOpacity>
      <Text style={styles.title}>My Works</Text>
      <ScrollView showsVerticalScrollIndicator={true}>
        {works.map((work) => (
          <View key={work.id} style={styles.card}>
            <View>
              <Text style={styles.workTitle}>{work.title}</Text>
              <Text style={styles.workSub}>{work.stages}/5 stages complete</Text>
              {work.stages === 5 && <Text style={styles.verified}>✓ Fully Verified</Text>}
            </View>
            <View style={styles.toggle}>
              <Text style={styles.toggleLabel}>{work.forSale ? "For Sale" : "Private"}</Text>
              <Switch
                value={work.forSale}
                onValueChange={() => toggleSale(work.id)}
                trackColor={{ false: colors.brown, true: colors.primary }}
                thumbColor={colors.cream}
              />
            </View>
          </View>
        ))}
      </ScrollView>
      <TouchableOpacity style={styles.newButton} onPress={() => router.push("/scan-artist")}>
        <Text style={styles.newButtonText}>+ Start New Ledger</Text>
      </TouchableOpacity>
    </View>
  )
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background, paddingHorizontal: 24, paddingTop: 60 },
  back: { marginBottom: 24 },
  backText: { color: colors.subtext, fontSize: 16 },
  title: { color: colors.cream, fontSize: 28, fontWeight: "800", marginBottom: 24 },
  card: {
    backgroundColor: colors.card,
    borderRadius: 14,
    padding: 18,
    marginBottom: 14,
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
  },
  workTitle: { color: colors.cream, fontSize: 16, fontWeight: "700" },
  workSub: { color: colors.subtext, fontSize: 13, marginTop: 4 },
  verified: { color: colors.verified, fontSize: 12, marginTop: 4 },
  toggle: { alignItems: "center" },
  toggleLabel: { color: colors.subtext, fontSize: 11, marginBottom: 4 },
  newButton: { backgroundColor: colors.primary, padding: 18, borderRadius: 12, alignItems: "center", marginVertical: 16 },
  newButtonText: { color: colors.cream, fontSize: 16, fontWeight: "700" },
})
