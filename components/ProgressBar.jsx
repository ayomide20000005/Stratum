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
