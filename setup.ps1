# Stratum - Full Project Setup Script
# Run this from the stratum root folder

# ─── CONSTANTS ───────────────────────────────────────────────
Set-Content constants/colors.js @'
export const colors = {
  background: "#2C1A0E",
  primary: "#C4622D",
  secondary: "#E8C49A",
  cream: "#F5ECD7",
  brown: "#6B3A2A",
  verified: "#4CAF50",
  danger: "#D32F2F",
  text: "#F5ECD7",
  subtext: "#C4A882",
  card: "#3D2314",
}
'@

# ─── COMPONENTS ──────────────────────────────────────────────
Set-Content components/ArtworkCard.jsx @'
// components/ArtworkCard.jsx
import { View, Text, Image, StyleSheet, TouchableOpacity } from "react-native"
import { colors } from "../constants/colors"

export default function ArtworkCard({ title, artist, imageUrl, forSale, onPress }) {
  return (
    <TouchableOpacity style={styles.card} onPress={onPress}>
      <Image source={{ uri: imageUrl || "https://placehold.co/400x300/3D2314/F5ECD7?text=Artwork" }} style={styles.image} />
      <View style={styles.info}>
        <Text style={styles.title}>{title || "Untitled"}</Text>
        <Text style={styles.artist}>{artist || "Unknown Artist"}</Text>
        <View style={styles.badge}>
          <Text style={styles.badgeText}>✓ Verified</Text>
        </View>
        {forSale && <Text style={styles.sale}>For Sale</Text>}
      </View>
    </TouchableOpacity>
  )
}

const styles = StyleSheet.create({
  card: {
    backgroundColor: colors.card,
    borderRadius: 14,
    marginBottom: 16,
    overflow: "hidden",
  },
  image: {
    width: "100%",
    height: 200,
  },
  info: {
    padding: 14,
  },
  title: {
    color: colors.cream,
    fontSize: 16,
    fontWeight: "700",
  },
  artist: {
    color: colors.subtext,
    fontSize: 13,
    marginTop: 4,
  },
  badge: {
    marginTop: 8,
    backgroundColor: colors.verified + "33",
    alignSelf: "flex-start",
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 20,
    borderWidth: 1,
    borderColor: colors.verified,
  },
  badgeText: {
    color: colors.verified,
    fontSize: 12,
    fontWeight: "600",
  },
  sale: {
    color: colors.primary,
    fontSize: 13,
    marginTop: 6,
    fontWeight: "600",
  },
})
'@

Set-Content components/ScanButton.jsx @'
// components/ScanButton.jsx
import { TouchableOpacity, Text, StyleSheet } from "react-native"
import { colors } from "../constants/colors"

export default function ScanButton({ onPress, label }) {
  return (
    <TouchableOpacity style={styles.button} onPress={onPress}>
      <Text style={styles.icon}>⬡</Text>
      <Text style={styles.label}>{label || "SCAN"}</Text>
    </TouchableOpacity>
  )
}

const styles = StyleSheet.create({
  button: {
    width: 140,
    height: 140,
    borderRadius: 70,
    backgroundColor: colors.primary,
    alignItems: "center",
    justifyContent: "center",
    alignSelf: "center",
    shadowColor: colors.primary,
    shadowOffset: { width: 0, height: 8 },
    shadowOpacity: 0.5,
    shadowRadius: 20,
    elevation: 10,
  },
  icon: {
    fontSize: 36,
    color: colors.cream,
  },
  label: {
    color: colors.cream,
    fontSize: 14,
    fontWeight: "700",
    letterSpacing: 3,
    marginTop: 4,
  },
})
'@

Set-Content components/VerifyResult.jsx @'
// components/VerifyResult.jsx
import { View, Text, StyleSheet } from "react-native"
import { colors } from "../constants/colors"

export default function VerifyResult({ verified, artistName, artworkTitle }) {
  return (
    <View style={[styles.container, { backgroundColor: verified ? colors.verified + "22" : colors.danger + "22" }]}>
      <Text style={styles.icon}>{verified ? "✓" : "✕"}</Text>
      <Text style={[styles.status, { color: verified ? colors.verified : colors.danger }]}>
        {verified ? "VERIFIED" : "BEWARE — POTENTIAL FORGERY"}
      </Text>
      {verified ? (
        <>
          <Text style={styles.detail}>{artworkTitle}</Text>
          <Text style={styles.sub}>Registered by {artistName}</Text>
          <Text style={styles.sub}>5-stage chain of custody confirmed</Text>
        </>
      ) : (
        <>
          <Text style={styles.detail}>Texture mismatch detected</Text>
          <Text style={styles.sub}>No recorded history for this physical item</Text>
        </>
      )}
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    borderRadius: 16,
    padding: 28,
    alignItems: "center",
    marginTop: 24,
  },
  icon: {
    fontSize: 64,
    color: colors.cream,
  },
  status: {
    fontSize: 20,
    fontWeight: "800",
    letterSpacing: 2,
    marginTop: 12,
    textAlign: "center",
  },
  detail: {
    color: colors.cream,
    fontSize: 16,
    marginTop: 16,
    fontWeight: "600",
    textAlign: "center",
  },
  sub: {
    color: colors.subtext,
    fontSize: 13,
    marginTop: 6,
    textAlign: "center",
  },
})
'@

Set-Content components/ProgressBar.jsx @'
// components/ProgressBar.jsx
import { View, Text, StyleSheet } from "react-native"
import { colors } from "../constants/colors"

const STAGES = ["Substrate", "Underpainting", "Build-up", "Signature", "Proof of Life"]

export default function ProgressBar({ currentStage }) {
  return (
    <View style={styles.container}>
      {STAGES.map((stage, index) => (
        <View key={index} style={styles.stageWrapper}>
          <View style={[styles.dot, index < currentStage ? styles.done : index === currentStage ? styles.active : styles.inactive]} />
          <Text style={[styles.label, index === currentStage ? styles.activeLabel : styles.inactiveLabel]}>
            {stage}
          </Text>
        </View>
      ))}
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flexDirection: "row",
    justifyContent: "space-between",
    paddingHorizontal: 8,
    marginBottom: 24,
  },
  stageWrapper: {
    alignItems: "center",
    flex: 1,
  },
  dot: {
    width: 12,
    height: 12,
    borderRadius: 6,
    marginBottom: 6,
  },
  done: { backgroundColor: colors.verified },
  active: { backgroundColor: colors.primary, transform: [{ scale: 1.4 }] },
  inactive: { backgroundColor: colors.brown },
  label: {
    fontSize: 9,
    textAlign: "center",
  },
  activeLabel: { color: colors.cream, fontWeight: "700" },
  inactiveLabel: { color: colors.subtext },
})
'@

# ─── APP SCREENS ─────────────────────────────────────────────
Set-Content app/role-select.jsx @'
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
'@

Set-Content app/home.jsx @'
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
'@

Set-Content app/scan-artist.jsx @'
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
'@

Set-Content app/scan-collector.jsx @'
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
'@

Set-Content app/dashboard.jsx @'
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
'@

Set-Content app/artwork.jsx @'
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
'@

Set-Content app/profile.jsx @'
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
'@

Set-Content app/kyc.jsx @'
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
'@

# ─── BACKEND ─────────────────────────────────────────────────
Set-Content stratum-backend/server.js @'
// stratum-backend/server.js
const express = require("express")
const app = express()

app.use(express.json())

app.use("/api/auth", require("./routes/auth"))
app.use("/api/artwork", require("./routes/artwork"))
app.use("/api/verify", require("./routes/verify"))

app.listen(3000, () => console.log("Stratum backend running on port 3000"))
'@

Set-Content stratum-backend/routes/auth.js @'
// stratum-backend/routes/auth.js
const express = require("express")
const router = express.Router()

router.post("/register", (req, res) => {
  res.json({ message: "Register endpoint — connect Supabase auth here" })
})

router.post("/login", (req, res) => {
  res.json({ message: "Login endpoint — connect Supabase auth here" })
})

module.exports = router
'@

Set-Content stratum-backend/routes/artwork.js @'
// stratum-backend/routes/artwork.js
const express = require("express")
const router = express.Router()

router.get("/", (req, res) => {
  res.json({ message: "Get all artworks — connect database here" })
})

router.post("/", (req, res) => {
  res.json({ message: "Create artwork ledger — connect database here" })
})

module.exports = router
'@

Set-Content stratum-backend/routes/verify.js @'
// stratum-backend/routes/verify.js
// PLACEHOLDER — Verification engine will be plugged in here later
const express = require("express")
const router = express.Router()

router.post("/scan", (req, res) => {
  res.json({
    message: "Verification engine placeholder — research paper and engine coming soon",
    status: "pending"
  })
})

module.exports = router
'@

Set-Content stratum-backend/models/User.js @'
// stratum-backend/models/User.js
// Placeholder model — connect Supabase here later
const User = {
  id: "string",
  name: "string",
  email: "string",
  role: "artist | collector | institution",
  verified: "boolean",
  createdAt: "date"
}

module.exports = User
'@

Set-Content stratum-backend/models/Artwork.js @'
// stratum-backend/models/Artwork.js
// Placeholder model — connect Supabase here later
const Artwork = {
  id: "string",
  title: "string",
  artistId: "string",
  stages: "array of 5 hashes",
  forSale: "boolean",
  price: "number",
  createdAt: "date"
}

module.exports = Artwork
'@

Write-Host ""
Write-Host "STRATUM setup complete. All files created." -ForegroundColor Green
Write-Host "Run 'npx expo start' to launch the app." -ForegroundColor Cyan