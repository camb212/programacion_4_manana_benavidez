package com.ute.compose.ui.material3

// ui/Paso01_TextField.kt

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun Paso01Suma() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {
        Text(
            "Paso 1 · Suma de números",
            style = MaterialTheme.typography.titleMedium
        )
        HorizontalDivider()

        SumaNumeros()
    }
}

// ── Suma de números ───────────────────────────────
@Composable
private fun SumaNumeros() {
    var numero1 by remember { mutableStateOf("") }
    var numero2 by remember { mutableStateOf("") }
    var resultado by remember { mutableStateOf(0) }
    var error by remember { mutableStateOf(false) }

    Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {

        Text(
            "Suma de 2 números",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary
        )

        // Número 1
        OutlinedTextField(
            value = numero1,
            onValueChange = {
                numero1 = it
                error = false
            },
            label = { Text("Número 1") },
            isError = error && numero1.toIntOrNull() == null,
            supportingText = {
                if (error && numero1.toIntOrNull() == null) {
                    Text("Ingrese un número válido")
                }
            },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Next
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Número 2
        OutlinedTextField(
            value = numero2,
            onValueChange = {
                numero2 = it
                error = false
            },
            label = { Text("Número 2") },
            isError = error && numero2.toIntOrNull() == null,
            supportingText = {
                if (error && numero2.toIntOrNull() == null) {
                    Text("Ingrese un número válido")
                }
            },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Done
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        Button(
            onClick = {
                val n1 = numero1.toIntOrNull()
                val n2 = numero2.toIntOrNull()

                if (n1 == null || n2 == null) {
                    error = true
                } else {
                    resultado = n1 + n2
                }
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Sumar")
        }

        Text(
            text = "Resultado: $resultado",
            style = MaterialTheme.typography.bodyLarge
        )
    }
}

@Preview(showBackground = true)
@Composable
fun Paso01_Preview2() {
    MaterialTheme {
        Paso01Suma()
    }
}