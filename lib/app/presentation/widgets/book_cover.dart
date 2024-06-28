import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.width - 20,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.contain,
          placeholder: (context, url) => const _Loading(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
