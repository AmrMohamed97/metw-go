import 'package:flutter_test/flutter_test.dart';
import 'package:metw_go/core/models/order_action_response/order_action_response.dart';

void main() {
  test('OrderActionResponse.fromJson parses json correctly', () {
    final json = {
      "success": true,
      "message": "تم تسليم الطلب بنجاح",
      "data": {
        "order": {
          "id": 6,
          "order_number": "F-ORD-00000002",
          "priority": "normal",
          "distance_km": null,
          "pickup_address": "MetwGo order pickup - مصر الجديدة",
          "dropoff_address": "MetwGo order dropoff - مصر الجديدة",
          "sender": {
            "name": "MetwGo Order Sender",
            "phone": "01025960939"
          },
          "receiver": {
            "name": "MetwGo Order Receiver",
            "phone": "01025960941"
          },
          "parcels": [
            {
              "description": "MetwGo Seed Parcel",
              "weight": 3,
              "volume": 0
            }
          ],
          "fee": 52,
          "status": "delivered",
          "lifecycle": {
            "current_stage": "completed",
            "arrived_pickup_at": "2026-08-20T07:05:25+00:00",
            "pickup_confirmed_at": "2026-08-20T07:06:27+00:00",
            "arrived_dropoff_at": "2026-08-21T02:31:41+00:00",
            "delivered_at": "2026-08-21T02:32:34+00:00",
            "proof_photo_url": "https://lasco.evyx.lol/storage/metwgo/order-proofs/tOEp7dggAX9tgB3iKWz4CXKNWsEUevXGBGpqFfdB.png",
            "signature": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...",
            "checklist": {
              "package_count_verified": "1",
              "package_condition_verified": "1",
              "merchant_signature_obtained": "1"
            },
            "recipient_name": "أحمد محمد",
            "delivery_note": "تم التسليم بنجاح",
            "recipient_otp": "1234",
            "collected_amount": 150
          },
          "available_actions": {
            "arrive_pickup": false,
            "confirm_pickup": false,
            "arrive_dropoff": false,
            "complete_delivery": false
          },
          "order_details": {
            "title": "الطلبات",
            "transport_badge_label": "توصيل فوري | نقطة واحدة",
            "status_badge": {
              "key": "completed",
              "label": "مكتمل"
            },
            "summary": {
              "order_number_label": "رقم الطلب",
              "order_number": "F-ORD-00000002",
              "payment_badge_label": "الدفع عند الاستلام (كاش)"
            },
            "stops": [
              {
                "type": "pickup",
                "title": "نقطة الاستلام",
                "name": "MetwGo Order Sender",
                "address": "MetwGo order pickup - مصر الجديدة",
                "phone": "01025960939",
                "marker_color": "orange",
                "marker_label": null,
                "actions": {
                  "can_call": true,
                  "can_chat": true
                }
              }
            ],
            "details_card": {
              "title": "تفاصيل الشحنة",
              "point_label": null
            },
            "customer_review": null,
            "earnings": {
              "title": "تفاصيل الأرباح",
              "currency": "ج.م",
              "net_earnings_label": "صافي الربح",
              "net_earnings": 52,
              "order_amount_label": "سعر الطلب",
              "order_amount": 52,
              "delivery_fee_label": "الأجرة",
              "delivery_fee": 52,
              "commission_label": "عمولة MetwGo (15%)",
              "commission_amount": 0
            },
            "timeline": {
              "title": "الجدول الزمني",
              "events": [
                {
                  "key": "accepted",
                  "label": "تم قبول الطلب",
                  "location": "MetwGo order pickup - مصر الجديدة",
                  "at": "2026-08-20T07:03:45+00:00",
                  "time_label": "07:03 AM",
                  "is_completed": true
                }
              ]
            },
            "delivery_proof": {
              "title": "إثبات التسليم",
              "photos": [
                {
                  "type": "delivery_proof",
                  "url": "https://lasco.evyx.lol/storage/metwgo/order-proofs/tOEp7dggAX9tgB3iKWz4CXKNWsEUevXGBGpqFfdB.png"
                }
              ]
            }
          },
          "ongoing_order": {
            "mode": "dropoff",
            "header_note": "تواصل مع العميل للحصول على الموقع",
            "contact_name": "MetwGo Order Receiver",
            "contact_phone": "01025960941",
            "location_title": "جاري التوصيل للعميل",
            "location_address": "MetwGo order dropoff - مصر الجديدة",
            "location_city": null,
            "location_country": "المملكة العربية السعودية",
            "point_tabs": [
              {
                "index": 1,
                "label": "النقطة 1",
                "is_active": true
              }
            ],
            "active_point_index": 1,
            "pickup_title": null,
            "pickup_address": null,
            "pickup_city": null,
            "dropoff_title": "جاري التوصيل للعميل",
            "dropoff_address": "MetwGo order dropoff - مصر الجديدة",
            "dropoff_city": null,
            "dropoff_country": "المملكة العربية السعودية",
            "details_title": "تفاصيل الشحنة",
            "package_description": "MetwGo Seed Parcel",
            "weight_label": "3 كجم تقريباً",
            "payment_method_label": "الدفع عند الاستلام (كاش)",
            "order_total_label": "52.00 ج.م",
            "delivery_fee_label": "52.00 ج.م",
            "arrival_hint": "يرجى التواصل قبل الوصول بخمس دقائق",
            "primary_action_label": "تم الوصول للموقع"
          },
          "pickup_confirmation": {
            "title": "تأكيد الاستلام",
            "header_card": {
              "order_reference": "F-ORD-00000002",
              "merchant_name": "MetwGo Order Sender",
              "subtitle": "تأكيد عملية الاستلام من التاجر"
            },
            "order_reference": "F-ORD-00000002",
            "merchant_name": "MetwGo Order Sender",
            "subtitle": "تأكيد عملية الاستلام من التاجر",
            "steps_title": "خطوات الاستلام",
            "checklist_steps": [
              {
                "key": "package_condition_verified",
                "label": "التحقق من الشحنة",
                "completed": true,
                "required": true
              }
            ],
            "signature": {
              "title": "توقيع التاجر",
              "label": "توقيع التاجر",
              "reset_label": "إعادة التوقيع",
              "value": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...",
              "is_completed": true,
              "placeholder": "وقع هنا للاستلام"
            },
            "proof_photo": {
              "title": "صورة الشحنة",
              "label": "صورة الشحنة",
              "placeholder": "التقط صورة لإثبات الاستلام",
              "url": "https://lasco.evyx.lol/storage/metwgo/order-proofs/tOEp7dggAX9tgB3iKWz4CXKNWsEUevXGBGpqFfdB.png",
              "is_uploaded": true
            },
            "pickup_map": {
              "label": "الموقع",
              "address": "MetwGo order pickup - مصر الجديدة",
              "latitude": 30.0444,
              "longitude": 31.2357
            },
            "confirm_button_label": "تم الاستلام"
          },
          "dropoff_confirmation": {
            "title": "تأكيد التسليم",
            "address_card": {
              "title": "عنوان التوصيل",
              "address": "MetwGo order dropoff - مصر الجديدة",
              "city": null,
              "country": "المملكة العربية السعودية"
            },
            "address_title": "عنوان التوصيل",
            "receiver_name": "MetwGo Order Receiver",
            "address": "MetwGo order dropoff - مصر الجديدة",
            "signature": {
              "title": "توقيع العميل",
              "label": "توقيع العميل",
              "reset_label": "إعادة التوقيع",
              "value": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...",
              "is_completed": true,
              "placeholder": "وقع هنا للتسليم"
            },
            "proof_photo": {
              "title": "صورة الشحنة",
              "label": "صورة الشحنة",
              "placeholder": "التقاط صورة للشحنة عند الباب",
              "url": "https://lasco.evyx.lol/storage/metwgo/order-proofs/tOEp7dggAX9tgB3iKWz4CXKNWsEUevXGBGpqFfdB.png",
              "is_uploaded": true
            },
            "payment": {
              "title": "الدفع نقداً",
              "status_label": "مطلوب التحصيل",
              "required_amount_label": "المبلغ المطلوب",
              "required_amount": 52,
              "collected_amount_label": "المبلغ المستلم",
              "collected_amount": 150,
              "remaining_amount_label": "المبلغ المتبقي",
              "remaining_amount": 0,
              "currency": "ج.م"
            },
            "verification": {
              "title": "رمز التحقق",
              "hint": "أدخل الرمز المرسل للمستلم لدى العميل",
              "otp_length": 4,
              "digit_placeholder": "•"
            },
            "map": {
              "label": "الموقع",
              "latitude": 30.0444,
              "longitude": 31.2357
            },
            "confirm_button_label": "تم التسليم"
          },
          "delivered_success": {
            "title": "تم التسليم بنجاح",
            "subtitle": "تم تسليم الطلب بنجاح وإضافة العمولة إلى محفظتك.",
            "badge": "توصيل فوري",
            "earnings_title": "الأجرة المكتسبة",
            "earnings_amount": 52,
            "currency": "ج.م",
            "order_reference": "F-ORD-00000002",
            "delivered_at": "2026-08-21T02:32:34+00:00",
            "merchant_name": "MetwGo Order Sender",
            "customer_name": "MetwGo Order Receiver",
            "payment_method_label": "الدفع عند الاستلام (كاش)",
            "wallet_note": "يرجى إضافة العمولة في محفظتك. يمكنك متابعة تفاصيل الأرباح من خلال شاشة الأرباح.",
            "primary_action_label": "العودة للرئيسية",
            "secondary_action_label": "عرض تفاصيل الطلب"
          }
        }
      }
    };

    final response = OrderActionResponse.fromJson(json);
    expect(response.success, true);
    expect(response.data?.order?.id, 6);
    expect(response.data?.order?.dropoffConfirmation?.map?.latitude, 30.0444);
  });
}
