import 'package:flutter/material.dart';
 
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil de Usuário',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const UserProfileScreen(),
    );
  }
}
 
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    // o que está sendo implementado com widget Scaffold
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildHeaderSection(),
            _buildStatsSection(context), // Passa o contexto para LayoutBuilder
            _buildOptionsSection(),
          ],
        ),
      ),
    );
  }
 
  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: const <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/batdog.jpg'),
          ),
          SizedBox(height: 10),
          Text(
            'Batdog',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            'Desenvolvedor Flutter | Entusiasta de UI/UX',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
 
  Widget _buildStatsSection(BuildContext context) {
    // o que está sendo implementado com widget LayoutBuilder
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Layout de linha para telas largas
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildStatCard('Seguidores', '1.2K'),
              _buildStatCard('Posts', '250'),
              _buildStatCard('Likes', '10K'),
            ],
          );
        } else {
          // Layout de coluna para telas estreitas
          return Column(
            children: <Widget>[
              _buildStatCard('Seguidores', '1.2K'),
              _buildStatCard('Posts', '250'),
              _buildStatCard('Likes', '10K'),
            ],
          );
        }
      },
    );
  }
 
  Widget _buildStatCard(String title, String value) {
    // o que está sendo implementado com widget Card
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              value,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
 
  Widget _buildOptionsSection() {
    return Column(
      children: <Widget>[
        // o que está sendo implementado com widget Divider
        const Divider(),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Editar Perfil'),
          onTap: () { /* Ação */ },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Configurações'),
          onTap: () { /* Ação */ },
        ),
        const Divider(),
        // o que está sendo implementado com widget ListTile
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.redAccent),
          title: const Text('Sair', style: TextStyle(color: Colors.redAccent)),
          onTap: () { /* Ação */ },
        ),
        const Divider(),
      ],
    );
  }
}
