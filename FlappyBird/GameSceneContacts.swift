import Foundation
import SpriteKit

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA.categoryBitMask
        let bodyB = contact.bodyB.categoryBitMask
        
        if bodyA == BitMaskCategory.player && bodyB == BitMaskCategory.base || bodyA == BitMaskCategory.base && bodyB == BitMaskCategory.player {
            player.gameEnded()
            base.stopAnimation()
            self.removeAllActions()
            enumerateChildNodes(withName: "wall") { (node, _) in
                node.removeAllActions()
            }
            
            isEnd = true
            
            let gameOverLabel = SKSpriteNode(imageNamed: "gameover")
            
            gameOverLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
            gameOverLabel.zPosition = 100
            gameOverLabel.setScale(4)
            
            addChild(gameOverLabel)
        } else {
            print("ля чо просходит")
        }
    }
}
