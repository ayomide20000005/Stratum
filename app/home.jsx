// app/home.jsx
import { View, Text, StyleSheet, ScrollView, TouchableOpacity } from "react-native"
import { useRouter, useLocalSearchParams } from "expo-router"
import { colors } from "../constants/colors"
import ArtworkCard from "../components/ArtworkCard"
import ScanButton from "../components/ScanButton"

const MOCK_ARTWORKS = [
  { id: "1", title: "Aso-Oke Dreams", artist: "Amara Osei", forSale: true },
  { id: "2", title: "Lagos at Dusk", artist: "Chidinma Eze", forSale: false },
  { id: "3", title: "The Griot", artist: "Kofi Mensah", forSale: true },
]

export default function Home() {
  const router = useRouter()
  const { role } = useLocalSearchParams()

  const handleScan = () => {
    if (role === "artist") router.push("/scan-artist")
    else router.push("/scan-collector")
  }

  return (
    <View style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.greeting}>Welcome, {role ? role.charAt(0).toUpperCase() + role.slice(1) : "User"}</Text>
        <TouchableOpacity onPress={() => router.push("/profile")}>
          <Text style={styles.profileIcon}>◎</Text>
        </TouchableOpacity>
      </View>

      <ScanButton onPress={handleScan} />

      <Text style={styles.feedTitle}>Verified Artworks</Text>
      <ScrollView showsVerticalScrollIndicator={true} style={styles.feed}>
        {MOCK_ARTWORKS.map((art) => (
          <ArtworkCard
            key={art.id}
            title={art.title}
            artist={art.artist}
            forSale={art.forSale}
            onPress={() => router.push({ pathname: "/artwork", params: { id: art.id } })}
          />
        ))}
      </ScrollView>

      <View style={styles.nav}>
        <TouchableOpacity onPress={() => router.push("/home")}><Text style={styles.navItem}>⌂ Home</Text></TouchableOpacity>
        <TouchableOpacity onPress={handleScan}><Text style={styles.navItem}>⬡ Scan</Text></TouchableOpacity>
        <TouchableOpacity onPress={() => router.push("/dashboard")}><Text style={styles.navItem}>◫ Works</Text></TouchableOpacity>
        <TouchableOpacity onPress={() => router.push("/profile")}><Text style={styles.navItem}>◎ Profile</Text></TouchableOpacity>
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background, paddingTop: 60 },
  header: { flexDirection: "row", justifyContent: "space-between", alignItems: "center", paddingHorizontal: 24, marginBottom: 32 },
  greeting: { color: colors.cream, fontSize: 20, fontWeight: "700" },
  profileIcon: { color: colors.subtext, fontSize: 24 },
  feedTitle: { color: colors.subtext, fontSize: 13, letterSpacing: 2, paddingHorizontal: 24, marginTop: 32, marginBottom: 16 },
  feed: { flex: 1, paddingHorizontal: 24 },
  nav: { flexDirection: "row", justifyContent: "space-around", paddingVertical: 16, borderTopWidth: 1, borderTopColor: colors.card },
  navItem: { color: colors.subtext, fontSize: 13 },
})
