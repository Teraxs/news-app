import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/theme.dart';

class NewsList extends StatelessWidget {
  final List<Article>? news;

  const NewsList({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: news?.length,
        itemBuilder: (BuildContext context, int index) {
          return _New(news: news![index], index: index);
        });
  }
}

class _New extends StatelessWidget {
  final Article news;
  final int index;

  const _New({required this.news, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarCard(
          news: news,
          index: index,
        ),
        _TitleCard(news: news),
        _ImageCard(news: news),
        _BodyCard(news: news),
        _ButtonsCard(),
        const SizedBox(
          height: 10,
        ),
        const Divider()
      ],
    );
  }
}

// Top de la noticia
class _TopBarCard extends StatelessWidget {
  final Article news;
  final int index;
  const _TopBarCard({
    required this.news,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}. ',
            style: TextStyle(color: myTheme.colorScheme.secondary),
          ),
          Text(
            '${news.source?.name}. ',
          ),
        ],
      ),
    );
  }
}

// Titulo de la noticia
class _TitleCard extends StatelessWidget {
  final Article news;
  const _TitleCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        news.title ?? 'No Hay Titulo',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

// Imagen de la noticia
class _ImageCard extends StatelessWidget {
  final Article news;
  const _ImageCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (news.urlToImage != null)
                ? FadeInImage(
                    image: const AssetImage('assets/img/giphy.gif'),
                    placeholder: NetworkImage(news.urlToImage),
                  )
                : const Image(image: AssetImage('assets/img/no-image.png'))),
      ),
    );
  }
}

// Descripcion de la noticia
class _BodyCard extends StatelessWidget {
  final Article news;
  const _BodyCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        (news.description != null) ? news.description : '',
      ),
    );
  }
}

// Botones de la noticia
class _ButtonsCard extends StatelessWidget {
  const _ButtonsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        RawMaterialButton(
          onPressed: () {},
          fillColor: myTheme.accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.star_border),
        ),
        const SizedBox(width: 10),
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.more),
        )
      ]),
    );
  }
}
