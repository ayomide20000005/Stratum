// app/index.jsx
import { View, Text, StyleSheet, TouchableOpacity } from 'react-native'
import { useRouter } from 'expo-router'
import { colors } from '../constants/colors'

export default function Welcome() {
  const router = useRouter()

  return (
    <View style={styles.container}>
      <View style={styles.center}>
        <Text style={styles.logo}>STRATUM</Text>
        <Text style={styles.tagline}>Every Layer. Proven.</Text>
      </View>
      <TouchableOpacity style={styles.button} onPress={() => router.push('/role-select')}>
        <Text style={styles.buttonText}>Get Started</Text>
      </TouchableOpacity>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
    justifyContent: 'space-between',
    paddingVertical: 80,
    paddingHorizontal: 24,
  },
  center: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  logo: {
    fontSize: 48,
    fontWeight: 'bold',
    color: colors.cream,
    letterSpacing: 8,
  },
  tagline: {
    fontSize: 16,
    color: colors.subtext,
    marginTop: 12,
    letterSpacing: 2,
  },
  button: {
    backgroundColor: colors.primary,
    padding: 18,
    borderRadius: 12,
    alignItems: 'center',
  },
  buttonText: {
    color: colors.cream,
    fontSize: 16,
    fontWeight: '600',
  },
})