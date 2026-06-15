// MainActivity.kt
package com.ute.compose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import com.ute.compose.ui.screens.*
import androidx.compose.material3.MaterialTheme
import com.ute.compose.ui.material3.EjercicioPreview
import com.ute.compose.ui.material3.Paso02_CardScreen
import com.ute.compose.ui.screens.ui.S02_TextScreen
import com.ute.compose.ui.screens.ui.S03_ButtonScreen
import com.ute.compose.ui.screens.ui.S04_LayoutScreen
import com.ute.compose.ui.screens.ui.S05_ModifierScreen
import com.ute.compose.ui.screens.ui.S06_EstadoScreen
import com.ute.compose.ui.screens.ui.S07_StateHoistingScreen
import com.ute.compose.ui.screens.ui.S08_BienvenidaScreen


class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                // componentes basicos nativos:
                 //S01_SaludoScreen()
                 //S02_TextScreen()
                 //S03_ButtonScreen()
                // S04_LayoutScreen()
                 //S05_ModifierScreen()
                // S06_EstadoScreen()
                //S07_StateHoistingScreen()
                //S08_BienvenidaScreen()
                //componentes material 3:
                // ◀ CAMBIA AQUÍ para probar cada paso:
                // Paso01_TextFieldScreen()
                // Paso02_CardScreen()
                // Paso03_LazyColumnScreen()
                // Paso04_ScaffoldScreen()
                // Paso05_NavBarScreen()
                paso06_DialogosScreen()
                //EjercicioPreview()
                //Paso06_DialogosScreen()   // ← paso activo


            }
        }
    }
}

private fun MainActivity.paso06_DialogosScreen() {
    TODO("Not yet implemented")
}
