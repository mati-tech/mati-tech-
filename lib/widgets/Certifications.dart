// import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';
//
// class CertificatesSection extends StatelessWidget {
//   const CertificatesSection({Key? key}) : super(key: key);
//
//   // List of certificate images (use network images or assets)
//   final List<Map<String, String>> certificates = const [
//     {
//       'title': 'Mobile Developer Diploma from Samsung Academy',
//       'image': 'assets/english.png', // or network URL
//       'issued_by': 'Samsung Academy, Moscow',
//       'date': '2024',
//     }
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//       color: Colors.grey[50],
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Certificates',
//             style: TextStyle(
//               fontSize: 32,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87,
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             'My professional certifications and achievements',
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey,
//             ),
//           ),
//           const SizedBox(height: 30),
//
//           // Responsive grid for certificates
//           LayoutBuilder(
//             builder: (context, constraints) {
//               int crossAxisCount = 1;
//               if (constraints.maxWidth > 1200) {
//                 crossAxisCount = 4;
//               } else if (constraints.maxWidth > 800) {
//                 crossAxisCount = 3;
//               } else if (constraints.maxWidth > 500) {
//                 crossAxisCount = 2;
//               }
//
//               return GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: crossAxisCount,
//                   crossAxisSpacing: 20,
//                   mainAxisSpacing: 20,
//                   childAspectRatio: 1.2,
//                 ),
//                 itemCount: certificates.length,
//                 itemBuilder: (context, index) {
//                   return CertificateCard(
//                     title: certificates[index]['title']!,
//                     imagePath: certificates[index]['image']!,
//                     issuedBy: certificates[index]['issued_by']!,
//                     date: certificates[index]['date']!,
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CertificateCard extends StatelessWidget {
//   final String title;
//   final String imagePath;
//   final String issuedBy;
//   final String date;
//
//   const CertificateCard({
//     Key? key,
//     required this.title,
//     required this.imagePath,
//     required this.issuedBy,
//     required this.date,
//   }) : super(key: key);
//
//   void _showCertificateZoom(BuildContext context) {
//     // Check if it's a network image or asset
//     final isNetworkImage = imagePath.startsWith('http');
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           backgroundColor: Colors.transparent,
//           insetPadding: const EdgeInsets.all(20),
//           child: Stack(
//             children: [
//               // Zoomable image
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height,
//                 child: PhotoView(
//                   imageProvider: isNetworkImage
//                       ? NetworkImage(imagePath) as ImageProvider
//                       : AssetImage(imagePath),
//                   backgroundDecoration: const BoxDecoration(color: Colors.transparent),
//                   minScale: PhotoViewComputedScale.contained * 0.8,
//                   maxScale: PhotoViewComputedScale.covered * 3,
//                   initialScale: PhotoViewComputedScale.contained,
//                   heroAttributes: PhotoViewHeroAttributes(tag: imagePath),
//                 ),
//               ),
//
//               // Close button
//               Positioned(
//                 top: 40,
//                 right: 40,
//                 child: IconButton(
//                   onPressed: () => Navigator.pop(context),
//                   icon: const Icon(Icons.close, color: Colors.white, size: 30),
//                   style: IconButton.styleFrom(
//                     backgroundColor: Colors.black54,
//                     padding: const EdgeInsets.all(8),
//                   ),
//                 ),
//               ),
//
//               // Certificate info at bottom
//               Positioned(
//                 bottom: 40,
//                 left: 40,
//                 right: 40,
//                 child: Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.7),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         title,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         'Issued by: $issuedBy • $date',
//                         style: const TextStyle(
//                           color: Colors.white70,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: InkWell(
//         onTap: () => _showCertificateZoom(context),
//         borderRadius: BorderRadius.circular(12),
//         child: Container(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Certificate image
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     image: DecorationImage(
//                       image: imagePath.startsWith('http')
//                           ? NetworkImage(imagePath) as ImageProvider
//                           : AssetImage(imagePath),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: const Align(
//                     alignment: Alignment.bottomRight,
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Icon(
//                         Icons.zoom_in,
//                         color: Colors.white,
//                         size: 24,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 12),
//
//               // Certificate details
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//
//               const SizedBox(height: 4),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       issuedBy,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   Text(
//                     date,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: Colors.blue,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({Key? key}) : super(key: key);

  // List of certificate images using local assets
  final List<Map<String, String>> certificates = const [
    {
      'title': 'Mobile Developer Diploma from Samsung Academy',
      'image': 'photos/samsung.png', // Must match exactly what's in pubspec.yaml
      'issued_by': 'Samsung Academy, Moscow',
      'date': '2024',
    },
    {
      'title': 'Mobile Developer Diploma from Innopolis University',
      'image': 'photos/innopolis.png', // Must match exactly what's in pubspec.yaml
      'issued_by': 'Innopolis Univeristy, Russia',
      'date': '2024',
    },
    {
      'title': 'Top 200 international students of Moscow in 2024',
      'image': 'photos/200.png', // Must match exactly what's in pubspec.yaml
      'issued_by': 'Moscow, Russia',
      'date': '2024',
    },
    {
      'title': 'Yandex dev certificate',
      'image': 'photos/yandex.png', // Must match exactly what's in pubspec.yaml
      'issued_by': 'Yandex, Moscow',
      'date': '2025',
    },
    {
      'title': 'English Language Certificate',
      'image': 'photos/english.png', // Must match exactly what's in pubspec.yaml
      'issued_by': 'efset.org',
      'date': '2022',
    }

    // Add more certificates here with proper asset paths
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: Colors.grey[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Certificates',
            style: TextStyle(

              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            'My professional certifications and achievements',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          // Responsive grid for certificates
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;
              if (constraints.maxWidth > 1200) {
                crossAxisCount = 4;
              } else if (constraints.maxWidth > 800) {
                crossAxisCount = 3;
              } else if (constraints.maxWidth > 500) {
                crossAxisCount = 2;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.2,
                ),
                itemCount: certificates.length,
                itemBuilder: (context, index) {
                  return CertificateCard(
                    title: certificates[index]['title']!,
                    imagePath: certificates[index]['image']!,
                    issuedBy: certificates[index]['issued_by']!,
                    date: certificates[index]['date']!,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class CertificateCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String issuedBy;
  final String date;

  const CertificateCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.issuedBy,
    required this.date,
  }) : super(key: key);

  void _showCertificateZoom(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              // Zoomable image - using AssetImage for local assets
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: PhotoView(
                  imageProvider: AssetImage(imagePath), // Changed to AssetImage
                  backgroundDecoration: const BoxDecoration(color: Colors.transparent),
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 3,
                  initialScale: PhotoViewComputedScale.contained,
                  heroAttributes: PhotoViewHeroAttributes(tag: imagePath),
                ),
              ),

              // Close button
              Positioned(
                top: 40,
                right: 40,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black54,
                    padding: const EdgeInsets.all(8),
                  ),
                ),
              ),

              // Certificate info at bottom
              Positioned(
                bottom: 40,
                left: 40,
                right: 40,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Issued by: $issuedBy • $date',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => _showCertificateZoom(context),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Certificate image with error handling
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      // This shows if the asset is not found
                      return Container(
                        color: Colors.grey[200],
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error, color: Colors.red, size: 40),
                              SizedBox(height: 8),
                              Text(
                                'Image not found',
                                style: TextStyle(color: Colors.red),
                              ),
                              Text(
                                'Check pubspec.yaml',
                                style: TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Certificate details
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 4),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      issuedBy,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}