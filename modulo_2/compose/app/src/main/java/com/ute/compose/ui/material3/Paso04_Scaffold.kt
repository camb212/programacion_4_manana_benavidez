package com.ute.compose.ui.material3

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.ute.compose.model.contactosDeMuestra

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun Paso04_ScaffoldScreen() {

    var contactos by remember { mutableStateOf(contactosDeMuestra) }
    var busqueda by remember { mutableStateOf("") }
    var filtro by remember { mutableStateOf("Todos") }
    var mostrarFab by remember { mutableStateOf(false) }

    val contactosFiltrados = contactos
        .filter { c ->
            if (filtro == "Favoritos") c.favorito else true
        }
        .filter { c ->
            busqueda.isBlank() ||
                    c.nombre.contains(busqueda, ignoreCase = true)
        }

    Scaffold(

        // TOP BAR
        topBar = {

            TopAppBar(

                title = {

                    Text(
                        text = "Contactos (${contactos.size})",
                        fontWeight = FontWeight.Bold
                    )
                },

                actions = {

                    IconButton(
                        onClick = {
                            filtro =
                                if (filtro == "Favoritos")
                                    "Todos"
                                else
                                    "Favoritos"
                        }
                    ) {

                        Icon(
                            imageVector =
                                if (filtro == "Favoritos")
                                    Icons.Default.Favorite
                                else
                                    Icons.Default.FavoriteBorder,

                            contentDescription = "Favoritos"
                        )
                    }
                },

                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer,
                    titleContentColor = MaterialTheme.colorScheme.onPrimaryContainer
                )
            )
        },

        // FAB
        floatingActionButton = {

            FloatingActionButton(
                onClick = {
                    mostrarFab = true
                }
            ) {

                Icon(
                    imageVector = Icons.Default.PersonAdd,
                    contentDescription = "Nuevo contacto"
                )
            }
        }

    ) { paddingValues ->

        Column(
            modifier = Modifier
                .padding(paddingValues)
                .fillMaxSize()
        ) {

            // BUSCADOR
            OutlinedTextField(

                value = busqueda,

                onValueChange = {
                    busqueda = it
                },

                placeholder = {
                    Text("Buscar contacto...")
                },

                leadingIcon = {
                    Icon(Icons.Default.Search, null)
                },

                trailingIcon = {

                    if (busqueda.isNotEmpty()) {

                        IconButton(
                            onClick = {
                                busqueda = ""
                            }
                        ) {

                            Icon(
                                Icons.Default.Clear,
                                contentDescription = "Limpiar"
                            )
                        }
                    }
                },

                singleLine = true,

                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp)
            )

            // FILTROS
            LazyRow(

                horizontalArrangement = Arrangement.spacedBy(8.dp),

                contentPadding = PaddingValues(horizontal = 16.dp)

            ) {

                items(listOf("Todos", "Favoritos")) { opcion ->

                    FilterChip(

                        selected = filtro == opcion,

                        onClick = {
                            filtro = opcion
                        },

                        label = {
                            Text(opcion)
                        },

                        leadingIcon =
                            if (filtro == opcion) {

                                {
                                    Icon(
                                        imageVector = Icons.Default.Check,
                                        contentDescription = null,
                                        modifier = Modifier.size(
                                            FilterChipDefaults.IconSize
                                        )
                                    )
                                }

                            } else null
                    )
                }
            }

            Spacer(modifier = Modifier.height(4.dp))

            // LISTA
            LazyColumn(

                contentPadding = PaddingValues(
                    horizontal = 16.dp,
                    vertical = 8.dp
                ),

                verticalArrangement = Arrangement.spacedBy(8.dp)

            ) {

                item {

                    Text(
                        text = "${contactosFiltrados.size} resultado(s)",

                        style = MaterialTheme.typography.labelSmall,

                        color = MaterialTheme.colorScheme.onSurfaceVariant,

                        modifier = Modifier.padding(bottom = 4.dp)
                    )
                }

                items(
                    contactosFiltrados,
                    key = { it.id }
                ) { contacto ->

                    TarjetaContacto(

                        contacto = contacto,

                        onFavorito = {

                            contactos = contactos.map { c ->

                                if (c.id == contacto.id)
                                    c.copy(favorito = !c.favorito)
                                else
                                    c
                            }
                        }
                    )
                }

                item {
                    Spacer(modifier = Modifier.height(80.dp))
                }
            }
        }
    }

    // DIALOG
    if (mostrarFab) {

        AlertDialog(

            onDismissRequest = {
                mostrarFab = false
            },

            title = {
                Text("Nuevo contacto")
            },

            text = {
                Text("Esta función se conectará con el formulario.")
            },

            confirmButton = {

                TextButton(
                    onClick = {
                        mostrarFab = false
                    }
                ) {

                    Text("OK")
                }
            }
        )
    }
}

@Preview(showBackground = true)
@Composable
fun Paso04_Preview() {

    MaterialTheme {

        Paso04_ScaffoldScreen()
    }
}