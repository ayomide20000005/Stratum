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
