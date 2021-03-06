// Objective-C API for talking to github.com/inwecrypto/mobilesdk/neomobile Go package.
//   gobind -lang=objc github.com/inwecrypto/mobilesdk/neomobile
//
// File is generated by gobind. Do not edit.

#ifndef __Neomobile_H__
#define __Neomobile_H__

//@import Foundation;
#include "Universe.objc.h"
#include "ref.h"


@class NeomobileTx;
@class NeomobileWallet;

/**
 * Tx neo rawtx wrapper
 */
@interface NeomobileTx : NSObject <goSeqRefInterface> {
}
@property(strong, readonly) id _ref;

- (instancetype)initWithRef:(id)ref;
- (instancetype)init;
- (NSString*)data;
- (void)setData:(NSString*)v;
- (NSString*)id_;
- (void)setID:(NSString*)v;
@end

/**
 * Wallet neo mobile wallet
 */
@interface NeomobileWallet : NSObject <goSeqRefInterface> {
}
@property(strong, readonly) id _ref;

- (instancetype)initWithRef:(id)ref;
- (instancetype)init;
/**
 * Address get wallet address
 */
- (NSString*)address;
/**
 * CreateAssertTx create assert transfer raw tx
 */
- (NeomobileTx*)createAssertTx:(NSString*)assert from:(NSString*)from to:(NSString*)to amount:(double)amount unspent:(NSString*)unspent error:(NSError**)error;
/**
 * CreateClaimTx create claim tx
 */
- (NeomobileTx*)createClaimTx:(double)amount address:(NSString*)address unspent:(NSString*)unspent error:(NSError**)error;
/**
 * CreateNep5Tx create nep5 transfer transaction
 */
- (NeomobileTx*)createNep5Tx:(NSString*)asset from:(NSString*)from to:(NSString*)to gas:(double)gas amount:(int64_t)amount unspent:(NSString*)unspent error:(NSError**)error;
/**
 * MintToken .
 */
- (NeomobileTx*)mintToken:(NSString*)asset gas:(double)gas amount:(double)amount unspent:(NSString*)unspent error:(NSError**)error;
/**
 * Mnemonic gete mnemonic string
 */
- (NSString*)mnemonic:(NSString*)lang error:(NSError**)error;
/**
 * PubKey get public key string
 */
- (NSString*)pubKey;
/**
 * ToKeyStore write wallet to keystore format string
 */
- (NSString*)toKeyStore:(NSString*)password error:(NSError**)error;
@end

/**
 * DecodeAddress decode address
 */
FOUNDATION_EXPORT NSString* NeomobileDecodeAddress(NSString* address, NSError** error);

/**
 * EncodeAddress encode address
 */
FOUNDATION_EXPORT NSString* NeomobileEncodeAddress(NSString* address, NSError** error);

/**
 * FromKeyStore create wallet from keystore
 */
FOUNDATION_EXPORT NeomobileWallet* NeomobileFromKeyStore(NSString* ks, NSString* password, NSError** error);

/**
 * FromMnemonic create wallet from mnemonic
 */
FOUNDATION_EXPORT NeomobileWallet* NeomobileFromMnemonic(NSString* mnemonic, NSString* lang, NSError** error);

/**
 * FromWIF create wallet from wif
 */
FOUNDATION_EXPORT NeomobileWallet* NeomobileFromWIF(NSString* wif, NSError** error);

/**
 * New create a new wallet
 */
FOUNDATION_EXPORT NeomobileWallet* NeomobileNew(NSError** error);

#endif
