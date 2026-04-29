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
