//
//  gameController.swift
//  TareaiOS
//
//  Created by Adrian  on 26/10/23.
//
import UIKit

class gameController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    // Nombres de las imágenes en tu proyecto
    let imageNames = ["image1", "image2", "image3", "image4", "image5", "image6"]

    var shuffledImageNames: [String] = []
    var imageIndex = 0
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Baraja los nombres de las imágenes aleatoriamente
        shuffledImageNames = imageNames.shuffled()
        // Inicialmente, asigna imágenes aleatorias
        assignRandomImagesWithTimer()
    }

    @IBAction func jugarButtonTapped(_ sender: UIButton) {
        // Baraja nuevamente las imágenes para mostrar diferentes combinaciones
        print(shuffledImageNames)
        shuffledImageNames = imageNames.shuffled()
        imageIndex = 0
        assignRandomImagesWithTimer()
    }

    func assignRandomImagesWithTimer() {
        // Detén el temporizador si ya está en ejecución
        timer?.invalidate()

        // Inicia un temporizador que cambia la imagen cada 2 segundos
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateImage), userInfo: nil, repeats: true)
    }

    @objc func updateImage() {
        if imageIndex < shuffledImageNames.count {
            imageView.image = UIImage(named: shuffledImageNames[imageIndex])
            imageIndex += 1
        } else {
            // Todas las imágenes se han mostrado, detén el temporizador
            timer?.invalidate()
        }
    }
}
