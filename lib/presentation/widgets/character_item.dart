import 'package:flutter/material.dart';
import 'package:rickandmorty/constants/my_colors.dart';
import 'package:rickandmorty/data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),  // الهوامش حول الـ Container
      padding: const EdgeInsets.all(4),  // padding الداخلي
      decoration: BoxDecoration(
        color: MyColors.myWhite,  // الخلفية بيضاء
        borderRadius: BorderRadius.circular(8),  // حواف دائرية
        boxShadow: [
          BoxShadow(
            color: Colors.yellow,  // لون الظل (نصف شفاف)
            blurRadius: 16,  // تأثير التمويه (الضبابية)
            offset: Offset(0, 8),  // اتجاه الظل (إزاحة عمودية)
          ),
        ],
      ),
      child: GridTile(
        child: Container(
          color: MyColors.myGrey,  // الخلفية الرمادية للصورة
          child: character.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: "assets/images/Animation_Loading.gif",  // صورة تحميل مؤقتة
                  image: character.image,  // رابط الصورة الفعلي
                  fit: BoxFit.cover,  // تغطية المساحة بالكامل
                )
              : Image.asset("assets/images/avatar.webp"),  // صورة بديلة في حال عدم وجود صورة
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,  // خلفية داكنة للنص
          alignment: Alignment.bottomCenter,  // محاذاة النص في الأسفل
          child: Text(
            "${character.name}",  // اسم الشخصية
            style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: MyColors.myWhite,  // لون النص أبيض
              fontWeight: FontWeight.bold,  // جعل النص عريض
            ),
            overflow: TextOverflow.ellipsis,  // إضافة ثلاث نقاط عند تجاوز النص
            maxLines: 2,  // الحد الأقصى لعدد الأسطر
            textAlign: TextAlign.center,  // محاذاة النص في المنتصف
          ),
        ),
      ),
    );
  }
}
