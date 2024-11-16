import 'package:cloud_firestore/cloud_firestore.dart';

class RideService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createRideRequest(Map<String, dynamic> rideData) async {
    await _firestore.collection('ride_requests').add(rideData);
  }

  Stream<QuerySnapshot> getAvailableRides() {
    return _firestore
        .collection('ride_requests')
        .where('status', isEqualTo: 'pending')
        .snapshots();
  }

  Future<void> acceptRide(String rideId, String driverId) async {
    await _firestore.collection('ride_requests').doc(rideId).update({
      'status': 'accepted',
      'driverId': driverId,
    });
  }

  Future<void> completeRide(String rideId) async {
    await _firestore.collection('ride_requests').doc(rideId).update({
      'status': 'completed',
    });
  }
}